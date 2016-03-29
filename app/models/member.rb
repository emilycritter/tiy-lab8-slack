class Member < ActiveRecord::Base
  belongs_to :room
  belongs_to :user

  has_many :posts, dependent: :destroy

  validates :room, :user, presence: true
  validates :room_id, :uniqueness => {:scope=>:user_id}
end
