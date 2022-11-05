class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: { maximum: 100 }
  has_many :hashtag_posts, dependent: :destroy
  has_many :posts, through: :hashtag_posts
end
