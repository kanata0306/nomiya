class CreateDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :drinks do |t|
      t.references :post, null: false, foreign_key: true
      t.references :drink_category, null:false, foreigh_key: true
      t.string :name
      t.decimal :price
      t.timestamps
    end
  end
end