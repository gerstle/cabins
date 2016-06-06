class Reservation < ActiveRecord::Base
  belongs_to :accommodation
  belongs_to :processed_by_user, :class_name => 'User'
  belongs_to :user, :class_name => 'User'
end
