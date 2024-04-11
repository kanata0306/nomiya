class AddDrinkCategoryIdToDrinks < ActiveRecord::Migration[6.1]
  def change
    remove_reference :drinks, :drink_category, foreign_key: true
  end
end
