class Post < ApplicationRecord
  belongs_to :user

  has_many :post_comments,      dependent: :destroy
  has_many :favorites,          dependent: :destroy

  validates   :user_id,         presence: true
  validates   :body,            presence: true,     length: { maximum: 500 }

  has_one_attached :post_image

  # 検索方法分岐
  def self.looks(word)
    @post = Post.where("body LIKE?","%#{word}%")
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def get_post_image
    if post_image.attached?
      post_image.variant(gravity: "center", resize:"1000x1000^", crop:"1000x1000+0+0").processed
    end
  end

  def index_post_image
    if post_image.attached?
      post_image.variant(gravity: "center", resize:"800x510^", crop:"800x510+0+0").processed
    end
  end
end
