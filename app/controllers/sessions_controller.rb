class SessionsController < ApplicationController

  def new
 
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      redirect_to "/castles"
    else
      redirect_to "/login"
    end
  end

  def destory
    session[:user_id] = nil
    redirect_to "/login"
  end
end
