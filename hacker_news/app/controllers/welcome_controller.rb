class WelcomeController < ApplicationController
  def index
    @user = User.new
    #ZM: What happens if you have 1,000,000 posts? 
    #ZM: Look into adding .limit(50)
    @posts = Post.all.order("created_at desc")
  end
end
