class CreateUserCastles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_castles do |t|
      t.integer :user_id
      t.integer :castle_id
      t.timestamps
    end
  end
end
