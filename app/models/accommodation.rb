class Accommodation < ActiveRecord::Base
  belongs_to :accommodation_type
  belongs_to :building
  has_many :reservation

  validates :occupancy, presence: true, numericality: :integer, allow_blank: false
  validates :quantity, presence: true, numericality: :integer, allow_blank: false
  validates :price, presence: true, numericality: :decimal, allow_blank: false

  def self.search(params)
    rv = where(nil)
    if (params[:kitchen].eql?('on'))
      rv = where('accommodations.kitchen = ?', true)
    end

    if (params[:bathroom].eql?('on'))
      rv = rv.where('accommodations.bathroom = ?', true)
    end

    if (params[:air_conditioning].eql?('on'))
      rv = rv.where('accommodations.air_conditioning = ?', true)
    end

    if params[:search]
      parm = "%#{params[:search]}%"
      rv = rv.where('accommodations.label LIKE ? OR accommodations.description LIKE ? OR b.label LIKE ?',
          parm, parm, parm).joins("LEFT OUTER JOIN buildings b ON b.id=accommodations.building_id")
    end

    rv
  end

  def self.filter_holds(admin)
    if !admin
      return where('accommodations.hold != true')
    end

    where(nil)
  end

end
