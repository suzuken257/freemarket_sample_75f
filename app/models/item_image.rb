class ItemImage < ApplicationRecord
  mount_uploader :src, ImageUploader
  belongs_to :item, inverse_of: :item_images
end
