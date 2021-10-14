class Recipe < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :material, presence: true, length: { maximum: 300 }
  validates :recipe, presence: true, length: { maximum: 1000 }
end
