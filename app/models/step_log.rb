class StepLog < ApplicationRecord
  belongs_to :user

  validates :user_id,         presence: true
  validates :calorie,         presence: true, numericality: true
  validates :number_of_step,  presence: true, numericality: true
  validates :walking_time,    presence: true, numericality: true
  validates :start_time,      presence: true

  def self.step_by_month(option)
    steps = {}
    date = Date.current.ago(11.month)
    for num in 1..12
      steps.store(date.beginning_of_month.strftime("%Y/%m月"), StepLog.where(start_time: date.beginning_of_month...date.end_of_month).sum(option))
      date = date.next_month
    end
    return steps
  end

  def self.step_by_month_table
    months = []
    date = Date.current
    for num in 1..12
      months << date.beginning_of_month
      date = date.prev_month
    end
    return months
  end

  def self.step_by_day_table
    days = []
    date = Date.current
    StepLog.where(start_time: date.beginning_of_month...date.end_of_month).each do
      days << date.beginning_of_month
      date = date.prev_day
    end
    return days
  end

  def self.month_recode(month, option)
    return  where(start_time: month.beginning_of_month...month.end_of_month).sum(option)
  end
end
