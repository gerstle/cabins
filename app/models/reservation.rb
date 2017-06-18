class Reservation < ActiveRecord::Base
  belongs_to :accommodation
  belongs_to :processed_by_user, :class_name => 'User', optional: true
  belongs_to :user, :class_name => 'User'
  belongs_to :payment_type, foreign_key: :payment_types_id, optional: true

  def send_booking_confirmation_email
    ReservationMailer.booking_confirmation(self).deliver_now
  end

  def send_paid_confirmation_email
    ReservationMailer.paid_confirmation(self).deliver_now
  end
end
