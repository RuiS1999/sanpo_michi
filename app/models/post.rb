class Post < ApplicationRecord
  belongs_to :user

  has_many :post_comments,      dependent: :destroy
  has_many :category_relations, dependent: :destroy
  has_many :favorites,          dependent: :destroy

  validates   :user_id,         presence: true
  validates   :body,            presence: true

  has_one_attached :post_image
end
