class Users::FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    Favorite.find_or_create_by(user_id: current_user.id, post_id: params[:post_id])
    redirect_to companies_post_path(params[:post_id])
  end

  def destroy
    post_favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    if post_favorite
      post_favorite.destroy
      redirect_to companies_post_path(params[:post_id])
    end
  end
end