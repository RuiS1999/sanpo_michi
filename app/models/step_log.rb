class StepLog < ApplicationRecord
  belongs_to :user

  validates :user_id,         presence: true
  validates :calorie,         presence: true, numericality: true
  validates :number_of_step,  presence: true, numericality: true
  validates :walking_time,    presence: true, numericality: true
  validates :start_time,      presence: true

  def self.step_by_month(user)
    steps = {}
    date = Date.current.ago(5.month)
    for num in 1..6
      steps.store(date.beginning_of_month.strftime("%Y/%m"), StepLog.where(user: user).where(start_time: date.beginning_of_month...date.end_of_month).sum(:walking_time))
      date = date.next_month
    end
    return steps
  end

end
