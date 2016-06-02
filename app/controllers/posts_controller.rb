class PostsController < ApplicationController
  before_action :require_admin

  def show_posts
    @posts = Post.where(category: @category)
    @path = Rails.application.routes.url_helpers.send("new_#{@category}_path")
    render 'posts/index'
  end

  def show_home
    @category = 'home'
    show_posts
  end

  def show_rules
    @category = 'rule'
    show_posts
  end

  def show_faq
    @category = 'faq'
    show_posts
  end

  def new
    @post = Post.new
    @post.category = @category
    @error = @post # tell _error_messages.html.erb to use this object for form errors
    render 'posts/new'
  end

  def new_home
    @category = 'home'
    new
  end

  def new_rules
    @category = 'rule'
    new
  end

  def new_faq
    @category = 'faq'
    new
  end

  def create
    @post = Post.new(post_params)
    @category = @post.category
    @error = @post # tell _error_messages.html.erb to use this object for form errors

    if @post.save
      flash.now[:success] = "#{@category} post created!"
      show_posts
    else
      new
    end
  end

  def show
    @post = Post.find(params[:id])
    @error = @post
  end

  def update
    @post = Post.find(params[:id])
    @category = @post.category
    @error = @post # tell _error_messages.html.erb to use this object for form errors

    if @post.update_attributes(post_params)
      flash.now[:success] = 'post updated'
      show_posts
    else
      render 'show'
    end
  end

  def delete
    @post = Post.find(params[:id])
    @category = @post.category
    @post.destroy
    flash.now[:success] = "post deleted"
    show_posts
  end

private
  def post_params
    params.require(:post).permit(:title, :body, :category, :sticky)
  end

end
