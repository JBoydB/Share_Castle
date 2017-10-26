class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.integer :topic_id
      t.string :url_type
      t.text :url
      t.timestamps
    end
  end
end
