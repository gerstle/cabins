class BlogController < ApplicationController
  def index
    if params[:category].present?
      category = params[:category];
    else
      category = 'home'
    end

    @posts = Post.where("category='#{category}'")
  end
end
