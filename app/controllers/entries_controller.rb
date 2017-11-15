class EntriesController < ApplicationController
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
      @entry = Entry.new(
      topic_id: params[:topic_id],
      entry: params[:entry]
      )
      if @entry.save
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
      @entry = Entry.find_by(id: params[:entry_id])
      render :edit
    end
  end

  def update
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:castle_id]).role == "Member"
      flash[:warning] = "You do not have permission to complete this action"
      redirect_to "/castles/#{params[:castle_id]}/"
    else
      @entry = Entry.find(params[:entry_id])
      @entry.entry = params[:entry]
      @entry.save
      redirect_to "/castles/#{@entry.topic.castle_id}/#{@entry.topic.id}"
    end
  end

  def destroy
    if UserCastle.find_by(user_id: current_user.id, castle_id: params[:castle_id]).role == "Member"
      flash[:warning] = "You do not have permission to complete this action"
      redirect_to "/castles/#{params[:castle_id]}/"
    else
      @topic = Topic.find_by(id: params[:topic_id])
      @entry = Entry.find_by(id: params[:entry_id])
      @entry.destroy
      redirect_to "/castles/#{@topic.castle_id}/#{@topic.id}"
    end
  end
end
