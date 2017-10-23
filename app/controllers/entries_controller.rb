class EntriesController < ApplicationController
  before_action :authenticate_user!
  def new
    @castle = Castle.find_by(id: params[:castle_id])
    @topic = Topic.find_by(id: params[:topic_id])
    render :new
  end

  def create
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

  def edit
    @entry = Entry.find_by(id: params[:entry_id])
    render :edit
  end

  def update
    @entry = Entry.find(params[:entry_id])
    @entry.entry = params[:entry]
    @entry.save
    redirect_to "/castles/#{@entry.topic.castle_id}/#{@entry.topic.id}"
  end

  def destroy
    @topic = Topic.find_by(id: params[:topic_id])
    @entry = Entry.find_by(id: params[:entry_id])
    @entry.destroy
    redirect_to "/castles/#{@topic.castle_id}/#{@topic.id}"
  end


end
