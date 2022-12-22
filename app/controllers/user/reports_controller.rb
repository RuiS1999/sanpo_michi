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
    unless current_user.id == post.user_id
      if report.save
        redirect_to posts_path
      else
        render :new
      end
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    report = current_user.reports.find_by(post_id: post.id)
    report.destroy
    redirect_back(fallback_location: root_path)
  end

  def report_params
    params.require(:report).permit(:reason)
  end

end
