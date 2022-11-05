class Post < ApplicationRecord
  belongs_to :user

  has_many :post_comments,    dependent: :destroy
  has_many :favorites,        dependent: :destroy
  has_many :reports,          dependent: :destroy
  has_many :hashtag_posts, dependent: :destroy
  has_many :hashtags, through: :hashtag_posts

  validates   :user_id,       presence: true
  validates   :body,          presence: true,     length: { maximum: 500 }
  validates   :hashbody,      presence: true,     length: { maximum: 500 }

  has_one_attached :post_image

  # 検索方法分岐
  def self.looks(word)
    @post = Post.where( ["body like? OR hashbody like?", "%#{word}%", "%#{word}%"] )
  end

  def self.hashtag_looks(word)
    @post = Post.where("hashbody LIKE?","%#{word}%")
  end

  # いいね済or未
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 報告済or未
  def reported_by?(user)
    reports.exists?(user_id: user.id)
  end

  def index_post_image
    if post_image.attached?
      post_image.variant(gravity: "center", resize:"700x400^", crop:"700x400+0+0").processed
    end
  end

  # ハッシュタグ
  after_create do
    post = Post.find_by(id: id)
    # hashbodyに打ち込まれたハッシュタグを検出
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      # ハッシュタグは先頭の#を外した上で保存
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      post.hashtags << tag
    end
  end
  #更新アクション
  before_update do
    post = Post.find_by(id: id)
    post.hashtags.clear
    hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      post.hashtags << tag
    end
  end
end
