class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :shipping_fee_burden
  # belongs_to_active_hash :item_status
  
  belongs_to :user
  belongs_to :category
  has_many :item_images, dependent: :destroy, inverse_of: :item
  accepts_nested_attributes_for :item_images, allow_destroy: true

  validates :item_images, presence: true,  length: {manimum: 1, maximum: 10}
  validates :name, presence: true, profanity_filter: true, length: { maximum: 40 }
  validates :price, presence: true, inclusion: 300..9999999
  validates :introduction, presence: true, profanity_filter: true, length: { maximum: 1000 }
  validates :item_status, presence: true
  validates :shipping_fee_burden, presence: true
  validates :shipping_area_from, presence: true
  validates :estimated_shipping_date, presence: true
  validates :category_id, presence: true
end 
