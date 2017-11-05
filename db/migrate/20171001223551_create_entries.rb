class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.integer :topic_id
      t.text :entry
      t.timestamps
    end
  end
end
