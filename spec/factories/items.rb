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
    user_id                 {1}
    user
    category { create(:category) }
  end

end