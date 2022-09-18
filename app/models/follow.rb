class Follow < ApplicationRecord
  belongs_to :user

  has_many :users,          dependent: :destroy

  validates :user_id,       presence: true
  validates :follower_id,   presence: true
end
