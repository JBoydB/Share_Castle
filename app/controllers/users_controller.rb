class UsersController < ApplicationController

  def new
    @user = User.new()
    render :new
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:confirm_password]
    )
    if user.save
      session[:user_id] = user.id
      redirect_to "/castles"
    else
      redirect_to "/signup"
    end
  end

  def show
  end

  def update
    #build current_user first ; embed edit in show page
  end
end
