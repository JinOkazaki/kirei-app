class LikesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    post.create_notification_like(current_user)
  end

  def destroy
    @like = current_user.likes.find_by(post_id: @post.id)
    @like.destroy
  end

  private 
  def set_post
    @post = Post.find(params[:post_id])
  end
end
