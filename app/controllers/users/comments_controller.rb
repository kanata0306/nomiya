class Users::CommentsController < ApplicationController



  # def create
  #   post = Post.find(params[:post_id])
  #   @comment = post.comments.build(comment_params)
  #   @comment.user = current_user
  #   if @comment.save
  #     redirect_back(fallback_location: root_path)
  #   else
  #     redirect_back(fallback_location: root_path)
  #   end
  # end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save!
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :post_id)
  end
end
