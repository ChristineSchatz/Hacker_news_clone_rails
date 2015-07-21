class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by(id: params[:id])
    redirect_to post_path(@post)
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
