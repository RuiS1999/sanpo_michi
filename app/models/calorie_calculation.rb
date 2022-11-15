class CalorieCalculation < ApplicationRecord
  belongs_to :user

  validates :mets,            presence: true
  validates :weight,          presence: true, numericality: true
  validates :walking_time,    presence: true, numericality: true
end
