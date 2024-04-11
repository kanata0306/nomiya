class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :store_name
      t.text :store_description
      t.string :business_hours
      t.text :drink_menu
      t.text :popular_courses_and_prices
      t.string :store_image

      t.timestamps
    end
  end
end
