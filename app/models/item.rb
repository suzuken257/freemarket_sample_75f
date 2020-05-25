class Item < ApplicationRecord
  has_many :comments
  has_many :item_images
  belongs_to :user
  belongs_to :category

  validates :name, presence: true, unless: :image?
  
  def show_last_items
    if (last_item = item.last).present?
      if last_item.content?
        last_item.content
      else
        '画像が投稿されています'
      end
    else
      'まだメッセージはありません。'
    end
  end

end
