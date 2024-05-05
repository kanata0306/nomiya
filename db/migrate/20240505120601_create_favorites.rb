class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|

      t.references :user, null: false, foregin_key: true
      t.references :post, null: false, foregin_key: true
      
      t.timestamps
    end
  end
end
