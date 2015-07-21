module ApplicationHelper
  #before_action :current_user, :require_logged_in, except: :index?
  def require_login
    redirect_to :root unless is_authenticated?
  end

  def is_authenticated?
    !!session[:user_id]
  end

  def permission_denied
    render :file => "public/401.html", :status => :unauthorized
  end
end
