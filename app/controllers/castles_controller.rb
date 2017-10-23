class CastlesController < ApplicationController
  before_action :authenticate_user!

  def new
    render :new
  end

  def create
    @castle = Castle.new(
      user_id: current_user.id,
      castle_name: params[:castle_name]
      )
    if @castle.save
      @castle_member = UserCastle.new(
        user_id: current_user.id,
        castle_id: @castle.id
        )
      @castle_member.save
      redirect_to "/castles/#{@castle.id}"
    else
      render :new
    end
  end

  def show
    @castle = Castle.find(params[:id])
    @topics = Topic.where(castle_id: params[:id])
    render :show
  end

  def edit
    @castle = Castle.find(params[:id])
    render :edit
  end

  def update
    @castle = Castle.find(params[:id])
    @castle.castle_name = params[:castle_name]
    if @castle.save
      redirect_to "/castles/#{@castle.id}"
    else
      render :edit
    end
  end

  def destroy
    @castle = Castle.find_by(id: params[:id])
    @castle.destroy
    redirect_to "/castles"
  end

end
