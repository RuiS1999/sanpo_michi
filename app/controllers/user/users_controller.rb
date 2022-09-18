class User::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(user_name: params[:id])
  end

  def edit
    @usr = User.find(current_user.id)
  end

  def update
    user = User.find(current_user.id)
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def withdrawal
    @user = user.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :user_name, :account_name, :introduction, :age, :sex, :is_deleted)
  end
end
