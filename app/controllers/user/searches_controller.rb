class User::SearchesController < ApplicationController

  def search_user
    @users = User.looks(params[:word])
  end

  def search_post
    @posts = Post.looks(params[:word])
  end
end
