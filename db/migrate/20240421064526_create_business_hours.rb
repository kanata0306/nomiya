class CreateBusinessHours < ActiveRecord::Migration[6.1]
  def change
    create_table :business_hours do |t|
      t.references :post, null: false, foreign_key: true

      t.time :open_time
      t.time :close_time
      t.boolean :is_closed, null: false, default: false
      t.integer :week_day, null: false

      t.timestamps
    end
  end
end
