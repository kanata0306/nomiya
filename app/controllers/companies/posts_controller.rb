class Companies::PostsController < ApplicationController
  
  before_action :authenticate_company!, only: [:new, :create]
  
  def new
    @post = Post.new
    @post.drinks.build
  end
  
  def create
    @post = current_company.posts.build(post_params)
    if @post.save
      redirect_to companies_post_path(@post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end
  def edit
    @post = Post.find(params[:id])
  end
  
  def index
    @posts = Post.includes(:business_hours, :drinks).all
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.drinks.destroy_all
    @post.business_hours.destroy_all
    @post.destroy
    redirect_to companies_posts_path, notice: "投稿を削除しました"
  end
end

private

  def authenticate_company!
    unless current_company
      redirect_to root_path, alert: "ログインしていません"
    end
  end

private

def post_params
  params.require(:post).permit(
    :store_name, 
    :store_description, 
    :popular_courses_and_prices, 
    :store_image, 
    drinks_attributes: [:id, :drink_category_id, :name, :price, :_destroy],
    business_hours_attributes: [
      :id,
      :weekday,
      :start_time,
      :end_time,
      :closed,
      :_destroy
    ]
  )
end
