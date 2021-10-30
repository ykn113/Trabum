class User < ApplicationRecord
  
  BEGINNER = "旅行ビギナー"
  MASTER = "旅行マスター"
  
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
  
end
