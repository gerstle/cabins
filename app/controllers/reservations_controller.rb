class ReservationsController < ApplicationController
  before_action :require_admin,   only: [:index, :update, :delete]

  def new
    existing_reservation = Reservation.find_by_user_id(current_user.id)

    if (!existing_reservation.nil?)
      flash.now[:danger] = 'What are you doing, you already have a reservation!'
      @user = User.find(current_user.id)
      @error = @user
      render 'users/show'
      return
    end

    @reservation = Reservation.new
    @accommodation = Accommodation.find(params[:accommodation_id])
    @quantity_available = quantity_available?(@accommodation)

    @reservation.quantity = 1
    @reservation.accommodation_id = @accommodation.id

    @error = @reservation
  end

  def create
    existing_reservation = Reservation.find_by_user_id(current_user.id)

    if (!existing_reservation.nil?)
      flash.now[:danger] = 'What are you doing, you already have a reservation!'
      @user = User.find(current_user.id)
      @error = @user
      render 'users/show'
      return
    end

    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.price = @reservation.accommodation.price
    @accommodation = @reservation.accommodation
    @error = @reservation # tell _error_messages.html.erb to use this object for form errors

    if @reservation.save
      flash.now[:success] = 'reservation successful!'
      render 'confirmation'
    else
      new
    end
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
