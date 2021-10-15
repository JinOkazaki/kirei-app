class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    user = comment.user
    render json:{comment: comment, user: user}
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(params[:post_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id,post_id: params[:post_id])
  end
end
