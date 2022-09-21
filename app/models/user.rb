class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :follow,         optional: true

  has_many :follows,          dependent: :destroy
  has_many :post_comments,    dependent: :destroy
  has_many :post,             dependent: :destroy
  has_many :favorites,        dependent: :destroy

  validates :email,           presence: true,   uniqueness: true
  validates :user_name,       presence: true,   uniqueness: true,   format: { with: /\A[a-z0-9]+\z/i }
  validates :account_name,    presence: true
  validates :age,             allow_nil: true,  numericality: { only_integer: true }
  validates :is_deleted,      inclusion: {in: [true, false]}


  has_one_attached :profile_image

  enum sex:    { male: 0, female: 1, other: 2 }

  def to_param
    user_name
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
