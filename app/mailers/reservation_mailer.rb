class ReservationMailer < ApplicationMailer

  def booking_confirmation(reservation)
    @reservation = reservation
    mail to: reservation.user.email, subject: 'FnF 2016 Cabins Booking Confirmation'
  end

  def paid_confirmation(reservation)
    @reservation = reservation
    mail to: reservation.user.email, subject: 'FnF 2016 Cabins Payment Confirmation'
  end
end
