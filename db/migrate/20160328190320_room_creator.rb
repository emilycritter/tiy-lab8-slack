class RoomCreator < ActiveRecord::Migration
  def change
    remove_column :rooms, :user_id, :integer
    add_column :members, :creator_boolean, :boolean, default: false

    remove_column :posts, :room_id, :integer
    remove_column :posts, :user_id, :integer
    add_column :posts, :member_id, :integer

  end
end
