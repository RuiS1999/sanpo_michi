class User::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    if favorite.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    post = Post.find(params[:post_id])
     favorite = current_user.favorites.find_by(post_id: post.id)
    if current_user.id == favorite.user_id
      if  favorite.destroy
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path)
      end
    end
  end


end
