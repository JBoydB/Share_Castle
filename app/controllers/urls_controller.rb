class UrlsController < ApplicationController
    before_action :authenticate_user!
  def new
    @castle = Castle.find_by(id: params[:castle_id])
    @topic = Topic.find_by(id: params[:topic_id])
    render :new
  end

  def create
    @topic = Topic.find_by(id: params[:topic_id])
    @url = Url.new(
     topic_id: params[:topic_id],
     url: params[:url],
     url_type: params[:url_type]
    )
    if @url.save
      redirect_to "/castles/#{@topic.castle_id}/#{@topic.id}"
    else
      render :new
    end
  end

  def edit
    @url = Url.find_by(id: params[:url_id])
    render :edit
  end

  def update
    @url = Url.find(params[:url_id])
    @url.url = params[:url]
    @url.save
    redirect_to "/castles/#{@url.topic.castle_id}/#{@url.topic.id}"
  end

  def destroy
    @topic = Topic.find_by(id: params[:topic_id])
    @url = Url.find_by(id: params[:url_id])
    @url.destroy
    redirect_to "/castles/#{@topic.castle_id}/#{@topic.id}"
  end
end
