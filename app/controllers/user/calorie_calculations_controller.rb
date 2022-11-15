class User::CalorieCalculationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @calorie_calculation = CalorieCalculation.new(calorie_calculation_params)
    if @calorie_calculation.mets.blank? || @calorie_calculation.weight.blank? || @calorie_calculation.walking_time.blank? || @calorie_calculation.mets * @calorie_calculation.weight * @calorie_calculation.walking_time * 1.05 == 0
      @calorie = "正しい数値を入力してください"
    else
      @walking_time = @calorie_calculation.walking_time / 60.to_f
      @calorie = @calorie_calculation.mets * @calorie_calculation.weight * @walking_time.round(1) * 1.05
    end
  end

  private

  def calorie_calculation_params
    params.require(:calorie_calculation).permit(:mets, :weight, :walking_time)
  end
end
