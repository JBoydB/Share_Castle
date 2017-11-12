class AddAvatarToCastles2 < ActiveRecord::Migration[5.1]
  
  def self.up
    add_attachment :castles, :avatar
  end

  def self.down
    remove_attachment :castles, :avatar
  end

end