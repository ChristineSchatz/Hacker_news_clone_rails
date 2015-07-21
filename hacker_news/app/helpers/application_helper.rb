module ApplicationHelper
  def show_edit_actions(object)
    true if session[:user_id] = object.user.id
  end

   #before_action :require_login, except: :index?

   #ZM: This should be in the app controller, 
   # Redirection is a controller responsibility
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
