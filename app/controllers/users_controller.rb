class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def show
    @nickname = current_user.nickname
    @posts = current_user.posts
  end

end
