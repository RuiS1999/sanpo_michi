class User::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      redirect_to post_path(post.id)
    else
      
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post.post_comments.all
  end

  def edit
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:user_id, :body, :post_image)
  end
end
