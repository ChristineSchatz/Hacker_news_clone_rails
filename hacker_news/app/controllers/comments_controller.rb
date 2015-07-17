class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    post = Post.find_by_id(params[:id])
    comment = Comment.new(comment_params)

    comment.save
    redirect :root
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
