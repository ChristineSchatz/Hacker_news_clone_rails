class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    #ZM: Use find_by(id:)
    #ZM: Also going to the Database to get the user is not necessary here
    user = User.find_by_id(session[:user_id])
    post = Post.new(post_params)
    #ZM: Instead do post.user_id = session[:user_id] & remove line below
    post.user = user
    post.save
    redirect_to :root
  end

  def show
    @post = Post.find_by_id(params[:id])
    #ZM: you don't need user here
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
    @post_votes = @post.votes
    if request.xhr?
      render json: {post_id: @post.id, post_votes: @post_votes}.to_json
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
