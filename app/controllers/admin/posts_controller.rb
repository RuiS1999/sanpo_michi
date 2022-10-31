class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.looks(params[:word])
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
class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.looks(params[:word])
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
