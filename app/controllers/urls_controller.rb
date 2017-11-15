class UrlsController < ApplicationController
    before_action :authenticate_user!

  def new
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:castle_id]).role == "Member"
      flash[:warning] = "You do not have permission to complete this action"
      redirect_to "/castles/#{params[:castle_id]}/"
    else
      @topics = Topic.where(castle_id: params[:castle_id])
      @castle = Castle.find_by(id: params[:castle_id])
      @topic = Topic.find_by(id: params[:topic_id])
      render :new
    end
  end

  def create
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:castle_id]).role == "Member"
      flash[:warning] = "You do not have permission to complete this action"
      redirect_to "/castles/#{params[:castle_id]}/"
    else
      @topic = Topic.find_by(id: params[:topic_id])
      @url = Url.new(
       topic_id: params[:topic_id],
       url: params[:url],
       url_type: params[:url_type]
      )
      if @url.url_type == "Video"
        @url.url.slice!("https://www.youtube.com/watch?v=")
      end
      if @url.save
        redirect_to "/castles/#{@topic.castle_id}/#{@topic.id}"
      else
        render :new
      end
    end
  end

  def edit
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:castle_id]).role == "Member"
      flash[:warning] = "You do not have permission to complete this action"
      redirect_to "/castles/#{params[:castle_id]}/"
    else
      @topics = Topic.where(castle_id: params[:castle_id])
      @url = Url.find_by(id: params[:url_id])
      render :edit
    end
  end

  def update
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:castle_id]).role == "Member"
      flash[:warning] = "You do not have permission to complete this action"
      redirect_to "/castles/#{params[:castle_id]}/"
    else
      @url = Url.find(params[:url_id])
      @url.url = params[:url]
      @url.save
      redirect_to "/castles/#{@url.topic.castle_id}/#{@url.topic.id}"
    end
  end

  def destroy
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:castle_id]).role == "Member"
      flash[:warning] = "You do not have permission to complete this action"
      redirect_to "/castles/#{params[:castle_id]}/"
    else
      @topic = Topic.find_by(id: params[:topic_id])
      @url = Url.find_by(id: params[:url_id])
      @url.destroy
      redirect_to "/castles/#{@topic.castle_id}/#{@topic.id}"
    end
  end
end
