class TopicsController < ApplicationController

  def new
    @castle = Castle.find_by(id: params[:castle_id])
    render :new
  end

  def create
    @topic = Topic.new(
     castle_id: params[:castle_id],
     title: params[:title]
    )
    if @topic.save
      redirect_to "/castles/#{@topic.castle_id}/#{@topic.id}"
    else
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    render :edit
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @topic.title = params[:title]
    @topic.save
    redirect_to "/castles/#{@topic.castle_id}/#{@topic.id}"
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @entries = Entry.where(topic_id: params[:topic_id])
    render :show
  end

  def destroy
    redirect_to "/castles/#{@topic.castle_id}"
  end
end
