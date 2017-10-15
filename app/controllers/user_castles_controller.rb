class UserCastlesController < ApplicationController

  def index
#    if current_user.user_castles.where(id: "#{current_user.id}").any?
#      @user_castles = current_user.user_castles.where(id: "#{current_user.id}")
       render :index
#    end
  end

end
