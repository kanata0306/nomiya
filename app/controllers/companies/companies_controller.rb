class Companies::CompaniesController < ApplicationController
  def show
    @company = current_company
  end
  
  def edit
    @company = current_company
  end
  
  def update
    @company = current_company
    if @company.update(company_params)
      redirect_to companies_companies_path
    else
      render :edit
    end
  end
  
  def destroy
    @company = current_company
    @company.destroy if @company
    redirect_to root_url
  end
  
  private
  
  def company_params
    params.require(:company).permit(:representative_name, :email, :phone_number, :address, :password, :pasword_confirmation)
  end
end
