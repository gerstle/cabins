class Post < ActiveRecord::Base
  validates :category, presence: true, length: { maximum: 40 }
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true
end
