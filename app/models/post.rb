class Post < ActiveRecord::Base
  validates :post, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
