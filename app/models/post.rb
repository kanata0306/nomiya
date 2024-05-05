class Post < ApplicationRecord
  has_many :drinks, dependent: :destroy
  belongs_to :company
  has_many :business_hours, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_one_attached :store_image
  
  accepts_nested_attributes_for :drinks, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :business_hours, reject_if: :all_blank, allow_destroy: true

  def business_hours_closed_on?(week_day)
    business_hours.exists?(week_day: week_day, is_closed: true)
  end
end
