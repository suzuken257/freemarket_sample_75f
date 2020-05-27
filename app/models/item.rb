class Item < ApplicationRecord
  belongs_to :user
  # accepts_nested_attributes_for :item_images, allow_destroy: true
  has_many :item_images, dependent: :destroy
end 
