FactoryBot.define do

  factory :item do
    name                    {"tomato"}
    price                   {1000}
    introduction            {"aaa"}
    brand                   {"aaa"}
    size                    {"aaa"}
    item_status             {"aaa"}
    shipping_fee_burden     {"aaa"}
    shipping_area_from      {"aaa"}
    estimated_shipping_date {"aaa"}
    user                    { create(:user) }
    category                { create(:category) }
    after(:build) do |item|
      item.item_images << build(:item_image, item: item)
    end
  end

  factory :item_image do
    src {Rack::Test::UploadedFile.new("spec/fixtures/test.jpg")}
  end
end