class EntriesController < ApplicationController

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
    render :edit
  end

  def update
  end

  def destroy
  end


end
