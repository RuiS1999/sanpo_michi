class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def show
  end

  def index
     @posts = Post.looks(params[:word])
  end
end
