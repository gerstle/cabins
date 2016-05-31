class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :is_admin?
  def is_admin?
    current_user ||= User.find_by(id: session[:user_id])
    !current_user.nil? && current_user.admin
  end

  def require_admin
    unless is_admin?
      flash[:danger] = 'access denied'
      redirect_to home_path
    end
  end
end
