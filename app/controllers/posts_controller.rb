class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit]
  before_action :back_index, only: :edit

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order("created_at DESC")
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy 
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user.id)
  end
  
  private 

  def post_params
    params.require(:post).permit(:image,:caption,:category_id).merge(user_id: current_user.id)
  end

  def back_index
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id
      redirect_to root_path
    end
  end

end
