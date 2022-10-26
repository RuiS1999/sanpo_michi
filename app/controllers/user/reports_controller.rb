class User::ReportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @report = current_user.reports.new(post_id: @post.id)
  end

  def create
    post = Post.find(params[:post_id])
    report = current_user.reports.new(report_params)
    report.post_id = post.id
    if report.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    Report.find(params[:id]).destroy
    redirect_to request.referer
  end

  def report_params
    params.require(:report).permit(:reason)
  end

end
