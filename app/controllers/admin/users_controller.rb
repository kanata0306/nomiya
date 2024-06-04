class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.all
    @users = @users.where('name LIKE ?', "%#{params[:keyword]}%") if params[:keyword].present?
  end
  
  def destroy
    @company = Company.find_by_id(params[:id])
    @company.destroy if @company
    flash[:notice] = "削除しました。"
    redirect_to admin_users_path
  end
end
