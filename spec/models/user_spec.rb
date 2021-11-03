require 'rails_helper'

RSpec.describe "userモデルに関するテスト", type: :model do
  context "バリデーションチェック" do
    it "emailが空欄でないこと" do
      user = User.new(email: '')
      expect(user).to be_invalid
      expect(user.errors[:email]).to include("can't be blank")
    end
  end
  describe 'アソシエーションのテスト' do
    context 'postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
  end
end