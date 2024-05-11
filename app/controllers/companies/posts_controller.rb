class Companies::PostsController < ApplicationController
  before_action :authenticate_company!, only: [:new, :create, :edit, :update]
  before_action :authenticate_user!, only: [:show, :create]
  
  def new
    @post = Post.new
    @post.drinks.build
    BusinessHour.week_days.each { |k, _v| @post.business_hours.build(week_day: k) }
  end

  def create
    @post = current_company.posts.build(post_params)
    if @post.save
      redirect_to companies_post_path(@post), notice: 'Post was successfully created.'
    else
      p @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to companies_post_path(@post)
    else
      render :edit
    end
  end

  def index
    @posts = Post.includes(:business_hours, :drinks)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
    
    # @comment = current_user.comments.new


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
    business_hours_attributes: [:id, :open_time, :close_time, :is_closed, :week_day ],
    drinks_attributes: [:id, :drink_category_id, :name, :price, :_destroy],
  )
end

