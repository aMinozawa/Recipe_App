class Recipe < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  default_scope -> { order(created_at: :desc) } 
  validates :title, presence: true, length: { maximum: 100 }
  validates :material, presence: true, length: { maximum: 300 }
  validates :recipe, presence: true, length: { maximum: 1000 }
  mount_uploader :dish, DishUploader
end
