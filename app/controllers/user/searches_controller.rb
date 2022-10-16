class User::SearchesController < ApplicationController

  def search_user
    @users = User.looks(params[:word]).where.not(id: current_user.id).where.not(is_deleted: true)
  end

  def search_post
    @posts = Post.looks(params[:word])
  end
end
