class Companies::PostsController < ApplicationController

  before_action :authenticate_company!, only: [:new, :create]

  def new
    @post = Post.new
    @post.drinks.build
    @post.build_business_hour

    pp @post.business_hour
  end

  def create
    pp '----------------'
    pp post_params


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

    business_hour_attributes: [
      :id,
      :m_start_time, :m_end_time,
      :t_start_time, :t_end_time,
      :w_start_time, :w_end_time,
      :h_start_time, :h_end_time,
      :f_start_time, :f_end_time,
      :s_start_time, :s_end_time,
      :u_start_time, :u_end_time,
      :m_closing,
      :t_closing,
      :w_closing,
      :h_closing,
      :f_closing,
      :s_closing,
      :u_closing,
      :_destroy
    ],
    drinks_attributes: [:id, :drink_category_id, :name, :price, :_destroy],
  )
end

