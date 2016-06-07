class AccommodationsController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_action :require_admin, except: [:index, :show]
  before_action :logged_in_user

  def index
    @lodgings = Accommodation.search(params[:search]).order(sort_column + ' ' + sort_direction, :id).page(params[:page]).per(10)
  end

  # def search
  #   wildcard_search = "%#{params[:search]}%"
  #   @lodgings = Accommodation.where("label LIKE ? OR description LIKE ?", wildcard_search, wildcard_search)
  # end

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

  def sort_column
    Accommodation.column_names.include?(params[:sort]) ? params[:sort] : "label"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
