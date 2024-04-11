class Drink < ApplicationRecord
  belongs_to :post
  belongs_to :drink_category
  attribute :name, :string

  def price
    # ここにpriceカラムの値を返すロジックを記述する
  end

  def price=(value)
    # ここにpriceカラムの値をセットするロジックを記述する
  end
end
