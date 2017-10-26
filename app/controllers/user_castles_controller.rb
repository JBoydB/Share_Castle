class UserCastlesController < ApplicationController
  before_action :authenticate_user!
  def index
     @user_castles = current_user.user_castles.where(user_id: current_user.id)
     render :index
  end

  def create
    if User.find_by(email: params[:user_email])
      castle_user = UserCastle.new(
        user_id: User.find_by(email: params[:user_email]).id,
        castle_id: params[:castle_id]
        )
      castle_user.save
    else
      flash[:warning] = "Share Castle account could not be found, please verify the email address entered"
    end
    redirect_to "/castles/#{params[:castle_id]}"
  end
end
