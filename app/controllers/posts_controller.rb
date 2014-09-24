class PostsController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    if @post.save
      flash[:notice] = 'Tweet sent!'
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @post.destroy
    flash[:alert] = 'tweet deleted'
    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:post, :user_id)
  end
end
