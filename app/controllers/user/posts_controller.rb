class User::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
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

  def hashtag
    @user = current_user
    if params[:name].nil?
      @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.posts.count}
    else
      @hashtag = Hashtag.find_by(hashname: params[:name])
      @post = @hashtag.posts
      @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.posts.count}
    end
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :body, :hashbody, :post_image, hashtag_ids: [])
  end
end
