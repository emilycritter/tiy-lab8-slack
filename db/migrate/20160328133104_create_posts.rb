class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_content
      t.integer :user_id
      t.integer :room_id
      t.string :photo_id

      t.timestamps null: false
    end
  end
end
