class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         authentication_keys: [:email]

  validates :company_name, :email, :representative_name, :phone_number, :address, presence: true
  validates :password, presence: true, on: :create
  has_one_attached :image
  has_many :posts, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |company|
    company.representative_name = "ゲスト"
    company.company_name = "ゲスト"
    company.phone_number = "00000000000"
    company.address = "日本"
    company.password = SecureRandom.urlsafe_base64
    end
  end

end
