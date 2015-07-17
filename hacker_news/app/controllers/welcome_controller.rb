class WelcomeController < ApplicationController
  def index
    @user = User.new
    @posts = Post.all.order("created_at desc")
  end
end
