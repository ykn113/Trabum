require 'rails_helper'

RSpec.describe "postモデルに関するテスト", type: :model do
  context "バリデーションチェック" do
    it "countryが空欄でないこと" do
      post = Post.new(country: '')
      expect(post).to be_invalid
      expect(post.errors[:country]).to include("can't be blank")
    end
    it "cityが空欄でないこと" do
      post = Post.new(city: '')
      expect(post).to be_invalid
      expect(post.errors[:city]).to include("can't be blank")
    end
     it "flightが空欄でないこと" do
      post = Post.new(flight: '')
      expect(post).to be_invalid
      expect(post.errors[:flight]).to include("can't be blank")
    end
    it "imageが空欄でないこと" do
      post = Post.new(image: '')
      expect(post).to be_invalid
      expect(post.errors[:image]).to include("can't be blank")
    end
    it "from_dateが空欄でないこと" do
      post = Post.new(from_date: '')
      expect(post).to be_invalid
      expect(post.errors[:from_date]).to include("can't be blank")
    end
    it "to_dateが空欄でないこと" do
      post = Post.new(to_date: '')
      expect(post).to be_invalid
      expect(post.errors[:to_date]).to include("can't be blank")
    end
    it "continent_idが空欄でないこと" do
      post = Post.new(continent_id: '')
      expect(post).to be_invalid
      expect(post.errors[:continent_id]).to include("can't be blank")
    end
  end
  
  describe 'アソシエーションのテスト' do
    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'continentモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:continent).macro).to eq :belongs_to
      end
    end
  end
end