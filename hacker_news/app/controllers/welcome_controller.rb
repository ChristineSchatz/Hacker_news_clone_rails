class WelcomeController < ApplicationController
  def index
    @user = User.new
    #Look into adding .limit(50)
    @posts = Post.all.order("created_at desc")
  end
end
