class Post < ApplicationRecord
  has_many :drinks
  accepts_nested_attributes_for :drinks, reject_if: :all_blank, allow_destroy: true
end
