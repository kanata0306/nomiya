class DrinkCategory < ApplicationRecord
  has_many :drinks

  before_update :drinks_check
  before_destroy :drinks_check

  private

  def drinks_check
    if self.drinks.any?
      self.errors.add(:base, "カテゴリーに紐づいたドリンクがあります。")
      throw(:abort)
    end
  end
end
