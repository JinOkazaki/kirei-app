class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :back_index, only: :edit
  before_action :search_item_category

  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(2)
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
    @comments = @post.comments.includes(:user).order("created_at DESC").page(params[:page]).per(2)
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

  def search
    @posts = @p.result.order("created_at DESC").page(params[:page]).per(2)
    category_id = params[:q][:category_id_eq]
    @category = Category.find_by(id: category_id)
  end

  def ranking
    @posts = Post.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
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

  def search_item_category
    @p = Post.ransack(params[:q])
  end

end
