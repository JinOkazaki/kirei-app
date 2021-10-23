require 'rails_helper'

RSpec.describe "投稿", type: :system do
  before do
    @post = FactoryBot.build(:post)
    @user = FactoryBot.create(:user)
  end
  context '投稿ができる時' do
    it 'ログインしたユーザーは投稿ができる' do
      visit new_user_session_path
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      expect(page).to have_content('投稿する')
      visit new_post_path
      image_path = Rails.root.join('public/images/test.png')
      attach_file('post[image]', image_path)
      fill_in 'post[caption]', with: @post.caption
      select '洗顔料', from: 'post[category_id]'
      expect{
        find('input[name="commit"]').click
      }.to change{Post.count}.by(1)
      expect(current_path).to eq(root_path)
      expect(page).to have_selector('img')
      expect(page).to have_content(@post.caption)
      expect(page).to have_content('化粧水')
    end
  end
  context '投稿ができない時' do
    it 'ログインしていないと投稿ができない' do
      visit root_path
      expect(page).to have_content('投稿する')
      visit new_post_path
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
