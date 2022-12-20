class User::StepLogsController < ApplicationController
  before_action :authenticate_user!
  def new
    @step_log = StepLog.new
  end

  def index
    @step_logs = current_user.step_logs
    @date = Date.today
    @month_date = @step_logs.where(start_time: @date.beginning_of_month...@date.end_of_month)
    @prev_month_date = @step_logs.where(start_time: @date.beginning_of_month.prev_month...@date.end_of_month.prev_month)
  end

  def show
    @step_log = StepLog.find(params[:id])
  end

  def create
    @step_log = StepLog.new(step_log_params)
    @step_log.user_id = current_user.id
    @step_logs = current_user.step_logs.all
    # 重複する日付を加算
    @step_logs.each do |step_log|
      if step_log.start_time == @step_log.start_time
        unless @step_log.calorie == nil ||  @step_log.number_of_step == nil || @step_log.walking_time == nil
          # calorie加算
          new_calorie = step_log.calorie + @step_log.calorie
          step_log.update_attribute(:calorie, new_calorie)
          # number_of_step加算
          new_number_of_step = step_log.number_of_step + @step_log.number_of_step
          step_log.update_attribute(:number_of_step, new_number_of_step)
          # walking_time加算
          new_walking_time = step_log.walking_time + @step_log.walking_time
          step_log.update_attribute(:walking_time, new_walking_time)
        end
        @step_log.delete
      end
    end
    if @step_log.save
      redirect_to step_log_path(@step_log)
    else
      render :new
    end
  end

  def destroy
    step_log = StepLog.find(params[:id])
    if current_user.id == step_log.user_id
      step_log.destroy
      redirect_to step_logs_path
    else
      redirect_to step_log_path(step_log)
    end
  end

  def edit
    @step_log = StepLog.find(params[:id])
  end

  def update
    @step_log = StepLog.find(params[:id])
    if current_user.id == @step_log.user_id
      if @step_log.update(step_log_params)
        redirect_to step_log_path(@step_log)
      else
        render :edit
      end
    else
      redirect_to step_log_path(@step_log)
    end
  end

  def graph
    @step_logs = current_user.step_logs
  end

  private

  def step_log_params
    params.require(:step_log).permit(:calorie, :number_of_step, :walking_time, :start_time)
  end
end
