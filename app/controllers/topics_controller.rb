class TopicsController < ApplicationController
  before_action :authenticate_user!

  def new
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:castle_id]).role == "Member"
      flash[:warning] = "You do not have permission to complete this action"
      redirect_to "/castles/#{params[:castle_id]}/"
    else
      @castle = Castle.find_by(id: params[:castle_id])
      render :new
    end
  end

  def create
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:castle_id]).role == "Member"
      flash[:warning] = "You do not have permission to complete this action"
      redirect_to "/castles/#{params[:castle_id]}/"
    else
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
  end

  def edit
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:castle_id]).role == "Member"
      flash[:warning] = "You do not have permission to complete this action"
      redirect_to "/castles/#{params[:castle_id]}/"
    else
      @topic = Topic.find(params[:topic_id])
      render :edit
    end
  end

  def update
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:castle_id]).role == "Member"
      flash[:warning] = "You do not have permission to complete this action"
      redirect_to "/castles/#{params[:castle_id]}/"
    else
      @topic = Topic.find(params[:topic_id])
      @topic.title = params[:title]
      @topic.save
      redirect_to "/castles/#{@topic.castle_id}/#{@topic.id}"
    end
  end

  def show
    @role = UserCastle.find_by(user_id: current_user.id, castle_id: params[:castle_id]).role
    @topic = Topic.find(params[:topic_id])
    @resource_links = @topic.urls.where(topic_id: params[:topic_id], url_type: "Resource Link")
    @image_links = @topic.urls.where(topic_id: params[:topic_id], url_type: "Image")
    @video_links = @topic.urls.where(topic_id: params[:topic_id], url_type: "Video")
    render :show
  end

  def destroy
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:castle_id]).role == "Member"
      flash[:warning] = "You do not have permission to complete this action"
      redirect_to "/castles/#{params[:castle_id]}/"
    else
      @topic = Topic.find(params[:topic_id])
      @topic.destroy
      redirect_to "/castles/#{params[:castle_id]}"
    end
  end
end
