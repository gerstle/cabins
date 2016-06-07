class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :update]
  before_action :correct_user,   only: [:show, :update]

  def new
    @user = User.new
    @error = @user # tell _error_messages.html.erb to use this object for form errors
  end

  def create
    @user = User.new(user_params)
    @error = @user # tell _error_messages.html.erb to use this object for form errors

    if @user.save
      log_in @user
      render 'pre_registered'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @error = @user
  end

  def update
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    @user = User.find(params[:id])
    @error = @user # tell _error_messages.html.erb to use this object for form errors

    if @user.update_attributes(user_params)
      flash.now[:success] = 'user updated'
      if is_admin?
        redirect_to registrations_path
      else
        redirect_to home_path
      end
    else
      render 'show'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :role, :notes, :tier_id)
    end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless is_current_user?(@user) || is_admin?
  end
end
