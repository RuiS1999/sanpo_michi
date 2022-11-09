class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_comments,    dependent: :destroy
  has_many :posts,            dependent: :destroy
  has_many :favorites,        dependent: :destroy
  has_many :reports,          dependent: :destroy
  has_many :step_logs,        dependent: :destroy

  # # follow機能
  # フォローする側から中間テーブルへのアソシエーション
  has_many :relationships, foreign_key: :following_id
  # フォローする側からフォローされたユーザを取得する
  has_many :followings, through: :relationships, source: :follower

  # フォローされる側から中間テーブルへのアソシエーション
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: :follower_id
  # フォローされる側からフォローしているユーザを取得する
  has_many :followers, through: :reverse_of_relationships, source: :following

  # あるユーザが引数で渡されたuserにフォローされているか調べるメソッド
  def is_followed_by?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
  end
  # # follow機能終了

  validates :email,           presence: true,   uniqueness: true
  validates :user_name,       presence: true,   length: { in: 4..15 },   uniqueness: true,   format: { with: /\A[a-z0-9]+\z/i }
  validates :account_name,    presence: true,   length: { in: 4..25 }
  validates :introduction,    length: { maximum: 500 }
  validates :is_deleted,      inclusion: {in: [true, false]}

  # 画像
  has_one_attached :profile_image
  has_one_attached :cover_image

  # userのsex => enum
  enum sex:    { male: 0, female: 1, other: 2 }

  # URLをaccount_nameにする
  def to_param
    user_name
  end

  # 検索方法分岐
  def self.looks(word)
      @user = User.where( ["account_name like? OR user_name like?", "%#{word}%", "%#{word}%"] )
  end

  # プロフィール画像正方形にする
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_profile_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(gravity: "center", resize:"300x300^", crop:"300x300+0+0").processed
  end

  # カバー画像リサイズ
  def get_cover_image
    unless cover_image.attached?
      file_path = Rails.root.join('app/assets/images/road.jpg')
      cover_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    cover_image.variant(gravity: "center", resize:"900x300^", crop:"900x300+0+0").processed
  end

end
