class Companies::PostsController < ApplicationController
  before_action :authenticate_company!, only: [:new, :create, :edit, :update, :destroy]
  #before_action :authenticate_user!, only: [:show]
  before_action :user_check, only: [:index]

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
    @posts = Post.all
    if current_company
      @posts = current_company.posts.includes(:business_hours, :drinks)
    else
      @posts = Post.includes(:business_hours, :drinks)
    end
    if params[:keyword].present?
      @posts = @posts.where("store_name LIKE(?)", "%#{params[:keyword]}%").or(
               @posts.where("store_description LIKE(?)", "%#{params[:keyword]}%")).or(
               @posts.where('drinks.name LIKE ?', "%#{params[:keyword]}%").references(:drinks))
    end
    if params[:business_hour].present?
      @posts =  @posts.where('business_hours.week_day': "#{params[:business_hour]}", 'business_hours.is_closed': false).references(:business_hours)
    end
    if params[:latitude].present? && params[:longitude].present?
      current_point = Post.new(latitude: params[:latitude], longitude: params[:longitude])
      @posts = current_point.nearbys(params[:distance].to_i, units: :km)
    end
    @posts = @posts.page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
    @company = @post.company
    # @comment = current_user.comments.new


  end

  def destroy
    @post = Post.find(params[:id])
    @post.drinks.destroy_all
    @post.business_hours.destroy_all
    @post.destroy
    redirect_to companies_posts_path, notice: "投稿を削除しました"
  end

  private

  def authenticate_company!
    unless current_company
      redirect_to root_path, alert: "ログインしていません"
    end
  end

  def user_check
    redirect_to root_url if current_user
  end

  def post_params
    params.require(:post).permit(
      :store_name,
      :store_description,
      :popular_courses_and_prices,
      :store_image,
      :address,
      :phone,
      business_hours_attributes: [:id, :open_time, :close_time, :is_closed, :week_day ],
      drinks_attributes: [:id, :drink_category_id, :name, :price, :_destroy],
    )
  end
end
