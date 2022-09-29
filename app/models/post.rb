class Post < ApplicationRecord
  belongs_to :user

  has_many :post_comments,      dependent: :destroy
  has_many :favorites,          dependent: :destroy

  validates   :user_id,         presence: true
  validates   :body,            presence: true,     length: { maximum: 250 }

  has_one_attached :post_image

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
