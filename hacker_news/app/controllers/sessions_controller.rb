class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: user_params[:username])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to :root
      # user authenticate
      # errors
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
