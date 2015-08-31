class PostsController < ApplicationController

  before_action :require_login, except: [:index, :show]

  def index
    @user = User.new
    @posts = Post.all.order('created_at desc')
  end

  def new
    @post = Post.new
  end

  def create
    user = User.find_by(id: session[:user_id])
    post = Post.new(post_params)
    post.user_id = session[:user_id]
    if post.save
      flash[:notice] = "Your post has been saved!"
      redirect_to :root
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :post
    end
  end

  def show
    @user = User.new
    @post = Post.find_by_id(params[:id])
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.update(params[:id], post_params)
    if @post.save
     flash[:notice] = "Your post has been succesfully updated!"
     redirect_to post_path(@post)
    else
     flash[:errors] = @post.errors.full_messages
     redirect_to edit_post_path(@post)
   end
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
    params.require(:post).permit(:title, :body).merge(user_id: current_user.id)
  end
end
