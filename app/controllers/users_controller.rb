class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show,:following,:followers]
  before_action :set_entry_room, only: [:show, :likes]

  def show
    @posts = @user.posts.order("created_at DESC").page(params[:page]).per(2)
  end

  def likes
    likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Post.where(id: likes).order("created_at DESC").page(params[:page]).per(2)
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private
  def set_entry_room
    @user = User.find(params[:id])
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
end

