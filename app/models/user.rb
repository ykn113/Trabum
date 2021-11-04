class User < ApplicationRecord

  BEGINNER = "紙ひこうき️"
  EXPERT = "ヘリコプター"
  MASTER = "ジェット機️"
  GRAND_MASTER = "ロケット"
  LEGEND = "スペースシップ"
  CAN_GET_BADGE = 2

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

  # ユーザーのレベルをチェックするメソッド
  def self.level_check(all_posts_count)
    case all_posts_count
    when 0..10
      @level = BEGINNER
    when 11..20
      @level = EXPERT
    when 21..30
      @level = MASTER
    when 31..40
      @level = GRAND_MASTER
    when 41..nill
       @level = LEGEND
    else
      @level = "レベルが読み込めませんでした"
    end
  end

  # 各エリアの投稿数をカウントし、バッジのあるエリアを配列でリターン
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
