class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :shipping_fee_burden
  # belongs_to_active_hash :item_status
  
  belongs_to :user
  belongs_to :category
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true

  validates :name, presence: true, profanity_filter: true
  validates :price, presence: true
  validates :introduction, presence: true, profanity_filter: true
  validates :item_status, presence: true
  validates :shipping_fee_burden, presence: true
  validates :shipping_area_from, presence: true


end 
