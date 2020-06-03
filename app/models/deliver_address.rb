class DeliverAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :zip_code, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :address1, presence: true
end
