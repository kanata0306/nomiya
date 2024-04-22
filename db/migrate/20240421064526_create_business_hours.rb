class CreateBusinessHours < ActiveRecord::Migration[6.1]
  def change
    create_table :business_hours do |t|
      t.time :open_time
      t.time :close_time
      t.string :day_of_week
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
