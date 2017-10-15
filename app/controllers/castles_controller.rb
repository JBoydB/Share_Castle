class CastlesController < ApplicationController

  def new
    render :new
  end

  def create
    @castle = Castle.new(
      user_id: 1,
      castle_name: params[:castle_name]
      )
    if @castle.save
      redirect_to "/castles/#{@castle.id}"
    else
      render :new
    end
  end

  def show
    @castle = Castle.find_by(id: params[:id])
    render :show
  end

  def edit
    @castle = Castle.find_by(id: params[:id])
    render :edit
  end

  def update
    @castle = Castle.find_by(id: params[:id])
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
