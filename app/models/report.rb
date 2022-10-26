class Report < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id,       presence: true
  validates :post_id,       presence: true
  validates :reason,        presence: true

  enum reason:    { not_interested: 0, spam: 1, offensive: 2, suicide: 3, other: 4 }
end
