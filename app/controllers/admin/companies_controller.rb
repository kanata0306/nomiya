class Admin::CompaniesController < ApplicationController
  def index
    @companies = Company.all
    @companies = @companies.where('company_name LIKE ?', "%#{params[:keyword]}%") if params[:keyword].present?
  end
  
  def destroy
    @company = Company.find_by_id(params[:id])
    @company.destroy if @company
    flash[:notice] = "削除しました。"
    redirect_to admin_companies_path
  end
end
