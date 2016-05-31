class PostsController < ApplicationController
  before_action :require_admin

  def index
    @posts = Post.where("category = '" + params[:category] + "'");
  end

  def new
    @post = Post.new
    @post.category = params[:category]
    @error = @post # tell _error_messages.html.erb to use this object for form errors
  end

  def create
    @post = Post.new(post_params)
    @error = @post # tell _error_messages.html.erb to use this object for form errors

    if @post.save
      flash[:success] = "#{@post.category} post created!"
      redirect_to controller: 'posts', action: 'index', category: @post.category
    else
      render new_post_path, category: params[:category]
    end
  end

  def show
    @post = Post.find(params[:id])
    @error = @post
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = 'post updated'
      if !@post.category.blank?
        redirect_to controller: 'posts', action: 'index', category: @post.category
      else
        redirect_to @post
      end
    else
      render edit_post_path
    end
  end

  def delete
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "post deleted"
    redirect_to controller: 'posts', action: 'index', category: @post.category
  end

private
  def post_params
    params.require(:post).permit(:title, :body, :category)
  end

end
