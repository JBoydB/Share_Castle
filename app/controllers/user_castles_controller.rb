class UserCastlesController < ApplicationController
  before_action :authenticate_user!
  def index
    @users_castles = current_user.castles.where(user_id: current_user.id)
    @castles_users = current_user.user_castles.where(user_id: current_user.id).where.not(role: "Owner")
    render :index
  end

  def create
    if User.find_by(email: params[:user_email])
      castle_user = UserCastle.new(
        user_id: User.find_by(email: params[:user_email]).id,
        castle_id: params[:castle_id],
        role: "Member"
        )
      castle_user.save
    else
      flash[:warning] = "ShareCastle account could not be found, please verify the email address entered"
    end
    redirect_to "/castles/#{params[:castle_id]}"
  end

  def update
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:castle_id]).role == "Member"
      flash[:warning] = "You do not have permission to complete this action"
      redirect_to "/castles/#{params[:castle_id]}/"
    else
      @member = UserCastle.find_by(user_id: params[:user_id], castle_id: params[:castle_id])
      @member.role = params[:role]
      @member.save
      redirect_to "/castles/#{params[:castle_id]}/members"
    end
  end

  def destroy
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:castle_id]).role == "Member"
      flash[:warning] = "You do not have permission to complete this action"
      redirect_to "/castles/#{params[:castle_id]}/"
    else
      @user_castle = UserCastle.find_by(user_id: params[:user_id], castle_id: params[:castle_id])
      @user_castle.destroy
      redirect_to "/castles/#{params[:castle_id]}/members"
    end
  end

  def members
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:castle_id]).role == "Member"
      flash[:warning] = "You do not have permission to complete this action"
      redirect_to "/castles/#{params[:castle_id]}/"
    else
      @topics = Topic.where(castle_id: params[:castle_id])
      @castle = Castle.find(params[:castle_id])
      @members = UserCastle.where(castle_id: params[:castle_id])
      render :members
    end
  end
end
