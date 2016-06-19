class ReservationsController < ApplicationController
  before_action :require_admin,   only: [:index, :update, :delete]
  before_action :purge_expired_reservations

  def new
    @reservation = Reservation.new
    @error = @reservation
  end

  def create
    # check that they don't already have a reservation
    existing_reservation = Reservation.find_by_user_id(current_user.id)
    if (!is_admin? && !existing_reservation.nil?)
      flash.now[:danger] = 'What are you doing, you already have a reservation!'
      @user = User.find(current_user.id)
      @error = @user
      render 'users/show'
      return
    end

    # create the initial reservation record
    @reservation = Reservation.new
    @reservation.quantity = 1
    @reservation.user = current_user
    @error = @reservation

    # check that the accommodation is still available
    @accommodation = Accommodation.find(params[:accommodation_id])
    @quantity_available = quantity_available?(@accommodation)

    if (@quantity_available == 0)
      redirect_to(accommodations_path, {:flash => {:danger => 'Sorry, looks like someone grabbed that one out from under you'}})
      return
    end

    @reservation.accommodation = @accommodation
    @reservation.price = @accommodation.price
    if @reservation.save
      render 'reservations/new'
    else
      redirect_to(accommodations_path, {:flash => {:danger => 'An unexpected error occurred.'}})
    end
  end

  def confirmation
    @reservation = Reservation.find_by(:id => params[:id])
    if (!@reservation)
      redirect_to(accommodations_path, {:flash => {:danger => 'Sorry, your reservation expired because you did not confirm it within 10 minutes.'}})
      return
    end
    @error = @reservation

    if (is_admin? && params[:reservation][:user_id])
      @reservation.user = User.find(params[:reservation][:user_id])
    else
      @reservation.user = current_user
    end
    @reservation.quantity = params[:reservation][:quantity]
    @reservation.price = @reservation.accommodation.price * @reservation.quantity
    @accommodation = @reservation.accommodation
    @error = @reservation # tell _error_messages.html.erb to use this object for form errors
    @reservation.confirmed_time = DateTime.now

    if @reservation.save
      render 'confirmation'
    else
      new
    end
  end

  def cancel
    query = Reservation.where('id=? AND confirmed_time IS NULL')
    if (!is_admin?)
      query.where('user_id=?', current_user.id)
    end

    @reservation = query
    if (@reservation)
      @reservation.first().destroy
    end
    redirect_to accommodations_path
  end

  helper_method :accommodation_name
  def accommodation_name(accommodation)
    if (accommodation.building.building_type.label.eql?('Cabin') || accommodation.building.building_type.label.eql?('Lodge'))
      return "#{accommodation.building.label} #{accommodation.label}"
    end

    accommodation.label
  end

  helper_method :sku
  def sku(reservation)
    "#{reservation.id}-#{reservation.accommodation.building.id}-#{reservation.accommodation.id}-#{reservation.user_id}"
  end

  # ADMIN -----------------------------------

  def index
    @reservations = Reservation.all()
  end

  def delete
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash.now[:success] = "reservation #{@reservation.id} deleted"

    index
    render 'reservations/index'
  end

  def paid
    @reservation = Reservation.find(params[:id])
    @error = @reservation# tell _error_messages.html.erb to use this object for form errors

    if @reservation.update(paid_date: DateTime.now(), processed_by_user_id: current_user.id)
      flash.now[:success] = "reservation #{@reservation.id} marked as paid"
      index
      render 'reservations/index'
    else
      render 'reservations/index'
    end
  end

  private
    def reservation_params
      params.require(:reservation).permit(:price, :quantity, :accommodation_id)
    end
end
