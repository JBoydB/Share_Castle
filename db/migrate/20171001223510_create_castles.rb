class CreateCastles < ActiveRecord::Migration[5.1]
  def change
    create_table :castles do |t|
      t.integer :user_id
      t.string :castle_name
      t.timestamps
    end
  end
end
