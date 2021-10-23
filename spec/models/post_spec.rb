require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿情報の保存' do
    context '投稿情報が保存できる時' do
      it '投稿情報が全て適切な情報で入力されていると保存できる' do
        expect(@post).to be_valid
      end
      context '投稿情報が保存できない時' do
        it '投稿画像が指定されていないと保存できない' do
          @post.image = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("画像を入力してください")
        end
        it '投稿説明文が空だと保存できない' do
          @post.caption = ''
          @post.valid?
          expect(@post.errors.full_messages).to include("テキストを入力してください")
        end
        it 'カテゴリーで、---を選択すると保存できない' do
          @post.category_id = 1
          @post.valid?
          expect(@post.errors.full_messages).to include("カテゴリーを選択してください")
        end
      end
    end
  end
end
