class TopicsController < ApplicationController

  def new
    render :new
  end

  def create
    @topic = Topic.new(
     castle_id: params[:id],
     title: params[:title]
    )
    if @topic.save
      redirect_to "/castles/#{@topic.castle_id}/#{@topic.id}"
    else
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    redirect_to "/castles/#{@topic.castle_id}/#{@topic.id}"
  end

  def show
    render :show
  end

  def destroy
    redirect_to "/castles/#{@topic.castle_id}"
  end
end
