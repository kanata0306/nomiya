class UsersController < ApplicationController
  def show
    @user = current_user
    @posts = @user.favorite_posts
  end
end
