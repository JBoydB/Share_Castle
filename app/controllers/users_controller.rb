class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def new
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
      puts "test"
      puts user.errors.messages
      redirect_to "/signup"
    end
  end

  def show
    @user = User.find_by(id: current_user.id)
  end

  def update
    user = User.find_by(id: current_user.id)
    user.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    redirect_to "/profile"
  end
end
