class UserCastlesController < ApplicationController

  def index
     @user_castles = current_user.user_castles.where(user_id: current_user.id)
     render :index
  end

end
