class Report < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id,       presence: true
  validates :post_id,       presence: true
  validates :reason,        presence: true

  enum reason:    { spam: 0, offensive: 1, suicide: 2, other: 3 }
end
