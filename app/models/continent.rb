class Continent < ApplicationRecord
  has_many :posts, dependent: :destroy
end
