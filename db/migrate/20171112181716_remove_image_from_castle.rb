class RemoveImageFromCastle < ActiveRecord::Migration[5.1]
  def change
    remove_column :castles, :image_file_name
    remove_column :castles, :image_content_type
    remove_column :castles, :image_file_size
    remove_column :castles, :image_updated_at
  end
end
