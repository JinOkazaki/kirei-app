class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def show
    @nickname = current_user.nickname
    @posts = current_user.posts.order("created_at DESC").page(params[:page]).per(2)
  end

end
