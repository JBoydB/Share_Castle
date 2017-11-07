class CreateRelatedTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :related_topics do |t|
      t.integer :topic_id
      t.integer :related_topic_id
      t.timestamps
    end
  end
end
