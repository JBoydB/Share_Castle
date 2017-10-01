class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.integer :castle_id
      t.string :title
      t.timestamps
    end
  end
end
