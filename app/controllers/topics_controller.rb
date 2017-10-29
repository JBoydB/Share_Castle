class TopicsController < ApplicationController
  before_action :authenticate_user!
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
    @resource_links = @topic.urls.where(topic_id: params[:topic_id], url_type: "Resource Link")
    @image_links = @topic.urls.where(topic_id: params[:topic_id], url_type: "Image")
    @video_links = @topic.urls.where(topic_id: params[:topic_id], url_type: "Video")
    render :show
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @topic.destroy
    redirect_to "/castles/#{params[:castle_id]}"
  end
end
