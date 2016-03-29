class Room < ActiveRecord::Base
  has_many :members, dependent: :destroy
  has_many :users, through: :members, dependent: :destroy
  has_many :posts, through: :members, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, format: { with: /\A[a-zA-Z][a-zA-Z0-9_-]+\z/,
    message: "must start with a letter and only contain letters, numbers, and underscores" }

end
