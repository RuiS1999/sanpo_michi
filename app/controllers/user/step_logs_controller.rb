class User::StepLogsController < ApplicationController
  before_action :authenticate_user!

  def index
    @step_logs = StepLog.all
    @step_log = StepLog.new
  end

  def show
    @step_log = StepLog.find(params[:id])
  end

  def create
    @step_log = StepLog.new(step_log_params)
    @step_log.user_id = current_user.id
    if @step_log.save
      redirect_to step_logs_path
    else
      render :index
    end
  end

  def destroy
    step_log = StepLog.find(params[:id])
    step_log.destroy
    redirect_to step_logs_path
  end

  def edit
    @step_log = StepLog.find(params[:id])
  end

  def update
    @step_log = StepLog.find(params[:id])
    if @step_log.update(step_log_params)
      redirect_to step_logs_path
    else
      render 'edit'
    end
  end

  private

  def step_log_params
    params.require(:step_log).permit(:calorie, :number_of_step, :walking_time, :start_time)
  end
end
