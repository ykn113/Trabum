class User < ApplicationRecord

  BEGINNER = "旅行ビギナー"
  MASTER = "旅行マスター"
  CAN_GET_BADGE = 1

  @continents = Continent.all

  has_secure_password validations: true
  validates :email, presence: true, uniqueness: true

  has_many :posts, dependent: :destroy

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA256.hexdigest(token.to_s)
  end

  def self.level_check(all_posts_count)
    case all_posts_count
    when 0..5
      @level = BEGINNER
    when 6..10
      @level = MASTER
    else
      @level = "???"
    end
  end

  def self.badge_check(user_posts)
    @has_area_badge = []

    for continent_id in 2..9 do
      area_count = user_posts.where(continent_id: continent_id).count
      if area_count >= CAN_GET_BADGE
        @has_area_badge.push(@continents.find(continent_id).name)
      end
    end
    
    @has_area_badge
  end

end
