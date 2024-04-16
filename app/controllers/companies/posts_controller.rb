class Companies::PostsController < ApplicationController
  def new
    @post = Post.new
    @post.drinks.build
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post,notice: 'Post was successfully created.'
    else
      render :new
    end
  end
  def edit
    @post = Post.find(params[:id])
  end
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
end

private

def post_params
  params.require(:post).permit(:store_name, :store_description, business_hours: {}, drinks_attributes: [:drink_category, :name, :price], popular_courses_and_prices: [])
end
