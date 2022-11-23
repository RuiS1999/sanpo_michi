class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @all_users = User.all
    @users = User.where(is_deleted: false)
    @posts = Post.all
  end
end
