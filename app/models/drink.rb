class Drink < ApplicationRecord
  belongs_to :post
  belongs_to :drink_category
  attribute :name, :string

end
