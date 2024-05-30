class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @comments = @comments.where('comment_content LIKE ?', "%#{params[:keyword]}%") if params[:keyword].present?
  end
  
  def destroy
    @comment = Comment.find_by_id(params[:id])
    @comment.destroy if @comment
    flash[:alert] = "削除しました"
    redirect_to admin_comments_path
  end
end
