class ItemImage < ApplicationRecord
  mount_uploader :src, ImageUploader
<<<<<<< Updated upstream
  belongs_to :item, inverse_of: :item_images
=======
  belongs_to :item, nverse_of: :item_images
>>>>>>> Stashed changes
end
