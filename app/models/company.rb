class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         authentication_keys: [:email]

  # 空白を禁止するバリデーションを追加
  validates :company_name, :representative_name, :phone_number, :address, presence: true
  validates :password, presence: true, on: :create
  has_one_attached :image
  has_many :posts, dependent: :destroy
end
