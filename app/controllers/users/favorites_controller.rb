class Users::FavoritesController < ApplicationController
  def create
    @post_favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
    @post_favorite.save
    redirect_to companies_post_path(params[:post_id])
  end

  def destroy
    @post_favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    if @post_favorite
      @post_favorite.destroy
      redirect_to companies_post_path(params[:post_id])
    else
    end
  end
end