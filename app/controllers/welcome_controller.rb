class WelcomeController < ApplicationController
  def index
    @posts = Post.where("category = 'welcome'")
  end
end
