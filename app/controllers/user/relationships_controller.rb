class User::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    following = current_user.relationships.build(follower_id: params[:user_user_name])
    following.save
    redirect_to request.referrer || root_path
  end

  def destroy
    following = current_user.relationships.find_by(follower_id: params[:user_user_name])
    following.destroy
    redirect_to request.referrer || root_path
  end
end
