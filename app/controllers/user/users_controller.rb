class User::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if user_signed_in?
      @users = User.where.not(id: current_user.id).where.not(is_deleted: true)
    else
      @users = User.where.not(is_deleted: true)
    end
  end

  def show
    @user = User.find_by(user_name: params[:user_name])
    @posts = @user.posts
    @user_favorites = @user.favorites
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def withdrawal
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to new_user_session_path
  end

  def followings
    user = User.find_by(user_name: params[:user_name])
    @users = user.followings
  end

  def followers
    user = User.find_by(user_name: params[:user_name])
    @users = user.followers
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :cover_image, :email, :user_name, :account_name, :introduction, :age, :sex, :is_deleted)
  end
end
