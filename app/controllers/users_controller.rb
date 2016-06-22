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

    set_planner_found
    if @user.save
      log_in @user
      @user.send_pre_registration_email
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
    before_tier = @user.tier_id
    @error = @user # tell _error_messages.html.erb to use this object for form errors

    set_planner_found
    if @user.update_attributes(user_params)
      flash.now[:success] = 'user updated'

      if (before_tier.nil? && !@user.tier_id.nil?)
        @user.send_tier_approved_email
      end

      if is_admin?
        @registrations = User.all
        render 'registrations/index'
      else
        @posts = Post.where(category: 'home').order(sticky: :desc, id: :asc)
        render 'blog/index'
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

  def set_planner_found
    planner = Planner.where(email: params[:user][:email].blank? ? @user.email : params[:user][:email])
    @user.planner_found = planner.blank? ? false : true

    if (@user.planner_found && params[:user][:tier_id].blank?)
      tier = Tier.find_by(label: 'Tier 2')
      if (@user.id.blank?)
        @user.tier = tier unless tier.nil?
      else
        params[:user][:tier_id] = tier.id unless tier.nil?
      end

      if is_admin?
        flash.now[:info] = "Planner email '#{@user.email}' recognized and automagically moved to #{tier.label}"
      end
    end
  end
end
