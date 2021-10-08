class UsersController < ApplicationController
  

  def show
    @nickname = current_user.nickname
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC").page(params[:page]).per(2)
  end

  def index
    users = User.where.not(id: current_user.id)
  end

  def followings
    user = User.find(paraml[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
  
end
