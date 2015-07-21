class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    #you have to link the user to the post here
    user = User.find_by_id(session[:user_id])
    post = Post.new(post_params)
    post.user = user
    post.save
    redirect_to :root
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(params[:user_id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    Post.update(params[:id], post_params)
    redirect_to user_path(session[:user_id])
  end

  def destroy
    Post.find_by(id: params[:id]).destroy
    redirect_to user_path(session[:user_id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
