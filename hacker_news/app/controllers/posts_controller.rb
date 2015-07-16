class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    user = User.find_by_id(session[:user_id])
    post = Post.new(post_params)
    post.user = user
    post.save
    redirect_to :root
  end

  def show
    @post = Post.find_by_id(params[:id])
    @user = User.find_by(params[:user_id])
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    Post.update(params[:id], post_params)
    redirect_to :root
  end

  def up_vote
    @post = Post.find_by_id(params[:id])
    @post.increment!(:votes)
    if request.xhr?
      return {post_votes: @post.votes}.to_json
      #head :ok
    else
      redirect_to @post
    end

  end

  def destroy
    Post.find_by_id(params[:id]).destroy
    redirect_to :root
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
