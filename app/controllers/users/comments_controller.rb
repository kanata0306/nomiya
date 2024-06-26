class Users::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]
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
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @comment.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  
  def comment_params
    params.require(:comment).permit(:comment_content, :post_id)
  end
  
  def correct_user
    @comment = current_user.comments.find_by_id(params[:id])
    redirect_to root_path unless @comment
  end
end
