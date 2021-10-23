require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録できる時' do
    it '正しい情報を入力すればユーザーの新規登録ができてトップページに移動する' do
      visit root_path
      expect(page).to have_content('SignUp')
      visit new_user_registration_path
      fill_in 'user[nickname]', with: @user.nickname
      fill_in 'user[age]', with: @user.age
      select '男性', from: 'user[gender_id]'
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      fill_in 'user[password_confirmation]', with: @user.password_confirmation
      expect{
        find('input[name="commit"]').click
      }.to change {User.count}.by(1)
      expect(current_path).to eq(root_path)
      expect(page).to have_content('LogOut')
      expect(page).to have_no_content('SignUp')
      expect(page).to have_no_content('Login')
    end
  end
  context 'ユーザー新規登録できない時' do
    it '誤った情報では新規登録できず新規登録ページへ戻ってくる' do
      visit root_path
      expect(page).to have_content('SignUp')
      visit new_user_registration_path
      fill_in 'user[nickname]', with: ''
      fill_in 'user[age]', with: ''
      select '---', from: 'user[gender_id]'
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
      fill_in 'user[password_confirmation]', with: ''
      expect{
        find('input[name="commit"]').click
      }.to change {User.count}.by(0)
      expect(current_path).to eq(user_registration_path)
    end
  end
end

RSpec.describe "ログイン", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインできる時' do
    it '保存されているユーザー情報と合致すればログインできる' do
      visit root_path
      expect(page).to have_content('Login')
      visit new_user_session_path
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      expect(page).to have_no_content('SignUp')
      expect(page).to have_no_content('Login')
    end
  end
  context 'ログインできない時' do
    it '保存されているユーザー情報と合致していないとログインできない' do
      visit root_path
      expect(page).to have_content('Login')
      visit new_user_session_path
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
      find('input[name="commit"]').click
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
