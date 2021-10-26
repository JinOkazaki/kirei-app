require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '必須項目が全て適切な情報で入力されていると登録できる' do
        expect(@user).to be_valid
      end
      context '新規登録できない時' do
        it 'ニックネームが空だと登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("ニックネームを入力してください")
        end
        it '年齢が空だと登録できない' do
          @user.age = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("年齢を入力してください", "年齢は半角数字で入力してください")
        end
        it '年齢を全角で入力すると登録できない' do
          @user.age = '２０'
          @user.valid?
          expect(@user.errors.full_messages).to include("年齢は半角数字で入力してください")
        end
        it '性別で---を選択すると登録できない' do
          @user.gender_id = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("性別を入力してください")
        end
        it 'メールアドレスが空だと登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールを入力してください")
        end
        it 'メールアドレスに@が無いと登録できない' do
          @user.email = 'test.com'
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールは不正な値です")
        end
        it '重複しているメールアドレスは登録できない' do
          @user.save
          another_user = FactoryBot.build(:user) 
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
        end
        it 'パスワードが空だと登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは6文字以上、半角英数混合で入力してください", "パスワード（確認用）とパスワードの入力が一致しません")
        end
        it 'パスワードとパスワード(確認用)が一致していないと登録できない' do
          @user.password_confirmation = 'aaa@bbb'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
        end
        it 'パスワードは6文字以上でなければ登録できない' do
          @user.password = '111aa'
          @user.password_confirmation = '111aa'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
        end
        it 'パスワードは半角数字のみでは登録できない' do
          @user.password = '111111'
          @user.password_confirmation = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは6文字以上、半角英数混合で入力してください")
        end
        it 'パスワードは半角英字のみでは登録できない' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは6文字以上、半角英数混合で入力してください")
        end
      end
    end
  end
end
