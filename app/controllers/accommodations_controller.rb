class AccommodationsController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_action :require_admin, except: [:index, :show]
  before_action :logged_in_user

  def index

    @lodgings = Accommodation.search(params)
                    .joins('LEFT OUTER JOIN (SELECT accommodation_id, COUNT(*) AS reserved_count FROM reservations GROUP BY accommodation_id) r ON r.accommodation_id=accommodations.id')
                    .where('accommodations.quantity - IFNULL(r.reserved_count, 0) > 0').filter_holds(is_admin?).order(sort_column + ' ' + sort_direction, :label).page(params[:page]).per(10)

    @lodgings
  end

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
    params.require(:accommodation).permit(:accommodation_type, :air_conditioning, :hold, :bathroom,
                                          :description, :kitchen, :label, :occupancy, :price, :quantity
    ) end

  def sort_column
    Accommodation.column_names.include?(params[:sort]) ? params[:sort] : "building_id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  # wonder if this could just be added to the main search...
  helper_method :quantity_available?
  def quantity_available?(accommodation)
    @connection = ActiveRecord::Base.connection
    result = @connection.exec_query(
        "SELECT a.hold, a.quantity - IFNULL(r.reserved_count, 0) AS quantity "\
        "FROM accommodations a LEFT OUTER JOIN "\
        "(SELECT accommodation_id, COUNT(*) AS reserved_count FROM reservations GROUP BY accommodation_id) "\
        "r ON r.accommodation_id=a.id WHERE a.id=#{accommodation.id}")

    if (result[0]['hold'].to_i.eql?(0) || is_admin?)
      return result[0]['quantity'].to_i
    end

    0
  end
end
