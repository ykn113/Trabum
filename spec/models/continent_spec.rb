require 'rails_helper'

RSpec.describe "continentモデルに関するテスト", type: :model do
  describe "アソシエーションのテスト" do
    context "postモデルとの関係" do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
  end
end