class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    if request.xhr?
      render partial: "form", layout: false
    end
  end

  def create
    post = Post.find_by_id(params[:post_id])
    comment = Comment.new(comment_params)
    comment.post = post
    comment.user_id = session[:user_id]
    if comment.save
      redirect_to post, notice: "Comment added!"
    else
      redirect_to post, notice: {errors: "Invalid comment."}
    end
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
