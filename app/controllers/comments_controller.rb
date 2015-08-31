class CommentsController < ApplicationController

  before_action :require_login, only: [:create]

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    if request.xhr?
      render partial: "form", layout: false
    end
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.build(comment_params)
    if comment.save && request.xhr?
      render json: {data: comment.body}.to_json
    else
      redirect_to :root, notice: "You must be logged in to comment."
    end
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :post_id).merge(user_id: current_user.id)
  end
end
