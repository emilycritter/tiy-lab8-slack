class Room < ActiveRecord::Base
  has_many :users, through: :members
  has_many :posts

  validates :name, :user_id, presence: true
  validates :name, uniqueness: true
  validates :name, format: { with: /\A[a-zA-Z][a-zA-Z0-9]+\z/,
    message: "must start with a letter and only contain letters, numbers, and underscores" }

end
