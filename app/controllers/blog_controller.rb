class BlogController < ApplicationController
  def show_category(category)
    @posts = Post.where(category: category)
    render 'blog/index'
  end

  def home
    show_category('home')
  end

  def rules
    show_category('rule')
  end

  def faq
    show_category('faq')
  end
end
