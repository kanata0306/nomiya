class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :company, foreign_key: true, nill: false
      t.string :store_name
      t.text :store_description
      t.text :popular_courses_and_prices

      t.timestamps
    end
  end
end
