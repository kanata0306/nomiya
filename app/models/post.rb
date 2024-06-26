class Post < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  
  belongs_to :company
  has_many :drinks, dependent: :destroy
  has_many :business_hours, dependent: :destroy
  has_many :comments, dependent: :destroy   
  has_many :favorites, dependent: :destroy
  has_one_attached :store_image
  
  validates :store_name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 100 }
  validates :phone, presence: true, length: { maximum: 12 }
  
  accepts_nested_attributes_for :drinks, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :business_hours, reject_if: :all_blank, allow_destroy: true

  def business_hours_closed_on?(week_day)
    business_hours.exists?(week_day: week_day, is_closed: true)
  end
  
  def favorited?(user)
   favorites.where(user_id: user.id).exists?
  end
end
