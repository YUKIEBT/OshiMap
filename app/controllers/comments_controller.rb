class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    
    if comment.save
      flash[:notice] = "コメントを投稿しました。"
    else
      flash[:alert] = "コメントの投稿に失敗しました。"
    end
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    comment.destroy
    flash[:notice] = "コメントを削除しました。"
  end

  private
  def comment_params
  params.require(:comment).permit(:content)
  end

end
