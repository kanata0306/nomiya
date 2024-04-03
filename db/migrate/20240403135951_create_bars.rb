class CreateBars < ActiveRecord::Migration[6.1]
  def change
    create_table :bars do |t|
      t.string :show
      t.string :index
      t.string :edit

      t.timestamps
    end
  end
end
