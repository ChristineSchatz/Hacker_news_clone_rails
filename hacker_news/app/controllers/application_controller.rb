class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :is_authenticated?, :current_user, except: :index

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  # def require_logged_in
  #   redirect_to :root unless is_authenticated?
  # end

  def is_authenticated?
    @authenticated =  !!session[:user_id]
  end

  def permission_denied
    render :file => "public/401.html", :status => :unauthorized
  end
end
