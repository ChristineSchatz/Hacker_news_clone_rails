class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    post = Post.find_by_id(params[:id])
    comment = Comment.new(comment_params)
  end

  def update
  end

  def destroy
  end

  private
  def comment_params

  end
end
