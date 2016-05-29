class PostsController < ApplicationController
  def index
    @posts = Post.where("category = '" + params[:category] + "'");
  end

  def new
    @post = Post.new
    @post.category='welcome'
    @error = @post # tell _error_messages.html.erb to use this object for form errors
  end

  def create
    @post = Post.new(post_params)
    @error = @post # tell _error_messages.html.erb to use this object for form errors

    if @post.save
      flash[:success] = "#{@post.category} post created!"
      redirect_to admin_welcomes_path
    else
      render new_welcome_path
    end
  end

private
  def post_params
    params.require(:post).permit(:title, :body, :category)
  end

end
