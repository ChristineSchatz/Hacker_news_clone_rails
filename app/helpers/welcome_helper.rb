module WelcomeHelper
  def find_user(object)
    object.user.username
  end
end
