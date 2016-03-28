class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  validates :post_content, :user_id, :room_id, presence: true
end
