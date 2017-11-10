class AddAvatarToCastles < ActiveRecord::Migration[5.1]
  
  def self.up
    add_attachment :castles, :image
  end

  def self.down
    remove_attachment :castles, :image
  end

end
