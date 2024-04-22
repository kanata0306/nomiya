class Post < ApplicationRecord
  has_many :drinks
  belongs_to :company
  has_many :business_hours
  
  accepts_nested_attributes_for :drinks, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :business_hours, reject_if: :all_blank, allow_destroy: true

  def business_hours_closed_on?(day)
    business_hours.exists?(weekday: day, closed: true)
  end
end
