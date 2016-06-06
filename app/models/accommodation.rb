class Accommodation < ActiveRecord::Base
  belongs_to :accommodation_type
  belongs_to :building
  has_many :reservation
end
