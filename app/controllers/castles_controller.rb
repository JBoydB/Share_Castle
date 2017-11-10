class CastlesController < ApplicationController
  before_action :authenticate_user!

  def new
    render :new
  end

  def create
    @castle = Castle.new(
      user_id: current_user.id,
      castle_name: params[:castle_name],
      image: params[:image]
      )
    if @castle.save
      @castle_member = UserCastle.new(
        user_id: current_user.id,
        castle_id: @castle.id,
        role: "Owner"
        )
      @castle_member.save
      redirect_to "/castles/#{@castle.id}"
    else
      p @castle.errors.messages
      render :new
    end
  end

  def show
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:id])
      @role = UserCastle.find_by(user_id: current_user.id, castle_id: params[:id]).role
      @castle = Castle.find(params[:id])
      @topics = Topic.where(castle_id: params[:id])
      render :show
    else
      redirect_to "/castles"
    end
  end

  def edit
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:id]).role != "Owner"
      flash[:warning] = "You do not have permission to complete this action"
      redirect_to "/castles/#{params[:id]}/"
    else
      @castle = Castle.find(params[:id])
      render :edit
    end
  end

  def update
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:id]).role != "Owner"
      flash[:warning] = "You do not have permission to complete this action"
      redirect_to "/castles/#{params[:id]}/"
    else
      @castle = Castle.find(params[:id])
      @castle.castle_name = params[:castle_name]
      if @castle.save
        redirect_to "/castles/#{@castle.id}"
      else
        render :edit
      end
    end
  end

  def destroy
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:id]).role != "Owner"
      flash[:warning] = "You do not have permission to complete this action"
      redirect_to "/castles/#{params[:id]}/"
    else
      @castle = Castle.find_by(id: params[:id])
      @castle.destroy
      redirect_to "/castles"
    end
  end

  def members
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:id]).role == "Member"
      flash[:warning] = "You do not have permission to complete this action"
      redirect_to "/castles/#{params[:id]}/"
    else
      @castle = Castle.find(params[:id])
      @members = UserCastle.where(castle_id: params[:id])
      render :members
    end
  end
end
