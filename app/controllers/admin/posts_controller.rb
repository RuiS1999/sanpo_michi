class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @post = Post.find(params[:id])
    @post_comments = @post.post_comments.all
  end

  def index
    @posts = Post.looks(params[:word])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end

  def report_post
    @posts = Post.all
    @report_posts = []
    @posts.each do |post|
      if post.reports.exists?
        @report_posts << post
      end
      @report_posts
    end
  end

end
