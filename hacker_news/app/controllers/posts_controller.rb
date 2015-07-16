class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    user = User.find_by(params[:user_id])
    user.posts << post
    redirect_to :root
  end

  def show
    @post = Post.find_by_id(params[:id])
    @user = User.find_by(params[:user_id])
  end

  def edit

  end

  def update
  end

  def destroy
    Post.find_by_id(params[:id]).destroy
    redirect_to :root
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
