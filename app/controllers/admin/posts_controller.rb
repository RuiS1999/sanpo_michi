class Admin::PostsController < ApplicationController
  def show
  end

  def index
     @posts = Post.looks(params[:word])
  end
end
