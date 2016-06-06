class User < ActiveRecord::Base
  belongs_to :tier
  has_many :reservations, foreign_key: :user_id
  has_many :processed_reservations, class_name: 'Reservation', foreign_key: :processed_by_user_id

  @allowed_roles = %w(planner planner_medical attendee)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_validation { self.phone = phone.gsub(/[^0-9]/, '') }
  before_save { self.email = email.downcase }
  before_save 'strip_whitespace'

  validates :name, presence: true, length: { maximum: 60 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, :if => :password
  validates :phone, presence: true, length: { maximum: 16 }
  validates :role, presence: true, length: { maximum: 20 }, :inclusion => { :in => @allowed_roles }

  has_secure_password

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private
    def strip_whitespace
      self.name = self.name.strip unless self.name.nil?
      self.email = self.email.strip unless self.email.nil?
      self.phone = self.phone.strip unless self.phone.nil?
      self.notes = self.notes.strip unless self.notes.nil?
    end
end
