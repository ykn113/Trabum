class Post < ApplicationRecord
  belongs_to :user
  belongs_to :continent
  attachment :image
  
  validates :country, :city, :flight, presence: true, length: { maximum: 20 }
  validates :image, :from_date, :to_date, :continent_id, presence: true
end
