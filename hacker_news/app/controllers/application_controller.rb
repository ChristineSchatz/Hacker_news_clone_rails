class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_current_user, :logged_in?

  def logged_in?
    @logged_in = !!session[:user_id]
  end

  def require_login
    unless logged_in?
      redirect_to login_path
    end
  end

  def get_current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
