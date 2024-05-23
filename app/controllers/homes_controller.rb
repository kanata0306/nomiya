class HomesController < ApplicationController
  
  def top
    if current_user
      @posts = Post.includes(:business_hours, :drinks)
      if params[:keyword].present?
        @posts = @posts.where("store_name LIKE(?)", "%#{params[:keyword]}%").or(
                 @posts.where("store_description LIKE(?)", "%#{params[:keyword]}%")).or(
                 @posts.where('drinks.name LIKE ?', "%#{params[:keyword]}%").references(:drinks))
      end
      if params[:business_hour].present?
        @posts =  @posts.where('business_hours.week_day': "#{params[:business_hour]}", 'business_hours.is_closed': false).references(:business_hours)
      end
      render 'companies/posts/index'
    end
  end
end
