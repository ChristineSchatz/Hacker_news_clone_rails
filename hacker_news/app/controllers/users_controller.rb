class UsersController < ApplicationController

  def new
    if logged_in?
      redirect_to user_path(@current_user)
    else
      @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to login_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @user_posts = Post.where(user_id: @current_user.id).order("created_at desc")
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
