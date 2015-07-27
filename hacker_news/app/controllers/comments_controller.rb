class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    if request.xhr?
      render partial: "form", layout: false
    end
  end

  def create
    comment = Comment.new(comment_params)
    #comment.post_id = params[:post_id] Remove line 12 / 14
    comment.user_id = session[:user_id]
    if comment.save && request.xhr?
      render json: {data: comment.body}.to_json
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
