module ApplicationHelper
  def show_edit_actions(object)
    true if session[:user_id] == object.user.id
  end

  def is_authenticated?
    !!current_user
  end

end
