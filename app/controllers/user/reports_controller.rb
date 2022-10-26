class User::ReportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @report = Report.new
  end

  def create
    post = Post.find(params[:post_id])
    report = current_user.reports.new(post_id: post.id)
    if report.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    report = current_user.reports.find_by(post_id: post.id)
    report.destroy
    redirect_to posts_path
  end
end
