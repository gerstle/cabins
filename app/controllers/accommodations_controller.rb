class AccommodationsController < ApplicationController
  before_action :require_admin

  def show
    @accommodation = Accommodation.find(params[:id])
    @error = @accommodation
  end

  def update
    @accommodation = Accommodation.find(params[:id])
    @error = @accommodation # tell _error_messages.html.erb to use this object for form errors

    if @accommodation.update_attributes(accommodation_params)
      flash.now[:success] = 'accommodation updated'
      redirect_to building_path(@accommodation.building)
    else
      render 'show'
    end
  end

  private

  def accommodation_params
    params.require(:accommodation).permit(:accommodation_type, :air_conditioning, :available, :bathroom,
                                          :description, :kitchen, :label, :occupancy, :price, :quantity
    )
  end
end
