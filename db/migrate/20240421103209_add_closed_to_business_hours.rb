class AddClosedToBusinessHours < ActiveRecord::Migration[6.1]
  def change
    add_column :business_hours, :closed, :boolean
  end
end
