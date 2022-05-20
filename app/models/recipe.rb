class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 250 }
  validates :cooking_time, :preperation_time, numericality: { greater_than_or_equal_to: 0 }
  validates :public, inclusion: { in: [true, false] }
end
