class Post < ActiveRecord::Base
  belongs_to :member

  validates :post_content, :member_id, presence: true
end
