class ItemImage < ApplicationRecord
  belongs_to :item, optional: ture

  mount_uploader :src, ImageUploader
end
