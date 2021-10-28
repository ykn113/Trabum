class Post < ApplicationRecord
  belongs_to :user
  belongs_to :continent
  attachment :image
end
