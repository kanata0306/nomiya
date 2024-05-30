class Admin::DrinkCategoriesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @drink_categories = DrinkCategory.all
  end

  def new
    @drink_category = DrinkCategory.new
  end

  def create
    @drink_category = DrinkCategory.new(drink_category_params)
    if @drink_category.save
      redirect_to admin_drink_categories_path, notice: "ドリンクカテゴリーを作成しました"
    else
      render :new
    end
  end

  def edit
    @drink_category = DrinkCategory.find(params[:id])
  end

  def update
    @drink_category = DrinkCategory.find(params[:id])
    if @drink_category.update(drink_category_params)
      redirect_to admin_drink_categories_path, notice: "ドリンクカテゴリーを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @drink_category = DrinkCategory.find(params[:id])
    if @drink_category.destroy
      redirect_to admin_drink_categories_path, notice: "ドリンクカテゴリーを削除しました"
    else
      redirect_to admin_drink_categories_path, alert: "ドリンクが紐づいているため、ドリンクカテゴリーが削除できません。"
    end
  end

  private

  def drink_category_params
    params.require(:drink_category).permit(:name)
  end
end
