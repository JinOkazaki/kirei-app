class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params.merge(user_id: current_user.id, post_id: params[:post_id]))
    user = comment.user
    comment_count = Post.find(params[:post_id]).comments.count
    render json:{comment: comment, user: user, comment_count: comment_count}
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(params[:post_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
