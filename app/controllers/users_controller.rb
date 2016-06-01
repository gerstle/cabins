class UsersController < ApplicationController
  def new
    @user = User.new
    @error = @user # tell _error_messages.html.erb to use this object for form errors
  end

  def create
    @user = User.new(user_params)
    @error = @user # tell _error_messages.html.erb to use this object for form errors

    if @user.save
      log_in @user
      flash[:success] = "Welcome to the FnF cabins registration system!"
      redirect_to controller: 'blog', action: 'index', category: 'home'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
