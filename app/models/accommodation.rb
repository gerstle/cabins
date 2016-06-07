class Accommodation < ActiveRecord::Base
  belongs_to :accommodation_type
  belongs_to :building
  has_many :reservation

  validates :occupancy, presence: true, numericality: :integer, allow_blank: false
  validates :quantity, presence: true, numericality: :integer, allow_blank: false
  validates :price, presence: true, numericality: :float, allow_blank: false

  def self.search(search)
    if search
      parm = "%#{search}%"
      where('label LIKE ? OR description LIKE ?', parm, parm)
    else
      where(nil)
    end
  end
end
