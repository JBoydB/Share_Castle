class CreateCastleGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :castle_groups do |t|
      t.integer :leading_castle_id
      t.integer :joining_castle_id
      t.string :join_status
      t.timestamps
    end
  end
end
