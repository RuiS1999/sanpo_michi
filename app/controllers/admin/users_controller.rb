class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.looks(params[:word])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @report_posts = []
    @posts.each do |post|
      if post.reports.exists?
        @report_posts << post
      end
      @report_posts
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(params[:id])
    else
      render :edit
    end
  end

  def withdrawal
    @user = User.find(params[:id])
    if @user.is_deleted == false
      @user.update(is_deleted: true)
    else
      @user.update(is_deleted: false)
    end
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to new_user_session_path
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :cover_image, :email, :user_name, :account_name, :introduction, :age, :sex, :is_deleted)
  end
end
