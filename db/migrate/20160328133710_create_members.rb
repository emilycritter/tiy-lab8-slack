class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :user_id
      t.integer :room_id

      t.timestamps null: false
    end
  end
end
