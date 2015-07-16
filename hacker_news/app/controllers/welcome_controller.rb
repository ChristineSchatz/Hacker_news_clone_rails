class WelcomeController < ApplicationController
  def index
    @user = User.new
    @posts = Post.all
  end
end
