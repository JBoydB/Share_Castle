class AddAttachmentAvatarToCastles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :castles do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :castles, :avatar
  end
end
