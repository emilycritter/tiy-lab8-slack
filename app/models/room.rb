class Room < ActiveRecord::Base
  has_many :users, through: :members

  validates :name, :user_id, presence: true
  validates :name, uniqueness: true

  attr_reader :room_paramaterize

  def room_paramaterize
    "#{id}-#{name.parameterize}"
  end

end
