class CreateBusinessHours < ActiveRecord::Migration[6.1]
  def change
    create_table :business_hours do |t|
      t.references :post, null: false, foreign_key: true

      t.time :open_time
      t.time :close_time

      t.time :m_start_time
      t.time :m_end_time
      t.boolean :m_closing

      t.time :t_start_time
      t.time :t_end_time
      t.boolean :t_closing

      t.time :w_start_time
      t.time :w_end_time
      t.boolean :w_closing

      t.time :h_start_time
      t.time :h_end_time
      t.boolean :h_closing

      t.time :f_start_time
      t.time :f_end_time
      t.boolean :f_closing

      t.time :s_start_time
      t.time :s_end_time
      t.boolean :s_closing

      t.time :u_start_time
      t.time :u_end_time
      t.boolean :u_closing

      t.timestamps
    end
  end
end
