class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :root
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @user_posts = Post.where(user_id: @user.id).order("created_at desc")
    if params[:id].to_i == session[:user_id]
      render 'users/show'
    else
      permission_denied
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
