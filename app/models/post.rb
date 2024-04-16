class Post < ApplicationRecord
  has_many :drinks
  belongs_to :company
  accepts_nested_attributes_for :drinks, reject_if: :all_blank, allow_destroy: true
end
