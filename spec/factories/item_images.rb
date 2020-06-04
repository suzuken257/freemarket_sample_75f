FactoryBot.define do
  factory :item_image do
    src {File.open("#{Rails.root}/public/uploads/item_image/src/1/cute_cat_illust_3737")}
    user
  end
end