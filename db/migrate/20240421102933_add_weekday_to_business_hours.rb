class AddWeekdayToBusinessHours < ActiveRecord::Migration[6.1]
  def change
    add_column :business_hours, :weekday, :integer
  end
end
