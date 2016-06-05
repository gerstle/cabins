class RegistrationsController < ApplicationController
  before_action :require_admin

  def index
    @registrations = User.all
  end

end
