class User < ActiveRecord::Base
  has_secure_password
  has_many :rooms, through: :members
  has_many :posts, dependent: :destroy

  validates :name, :email, :password, presence: true
  validates :name, :email, uniqueness: true

end
