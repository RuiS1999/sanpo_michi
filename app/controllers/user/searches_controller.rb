class User::SearchesController < ApplicationController

  def search_user
    if user_signed_in?
      @users = User.looks(params[:word]).where.not(id: current_user.id).where.not(is_deleted: true)
    else
      @users = User.looks(params[:word]).where.not(is_deleted: true)
    end
  end

  def search_post
    @posts = Post.looks(params[:word])
  end
end
