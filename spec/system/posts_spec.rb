require 'rails_helper'

describe '投稿のテスト' do
  describe '投稿一覧のテスト' do
    before do
      visit posts_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq 'posts'
      end
    end
  end
end