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
    
  end

  def update

  end

  def show

  end

  def destroy

  end
end
