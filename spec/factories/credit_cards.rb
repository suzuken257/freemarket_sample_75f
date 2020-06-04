FactoryBot.define do
  factory :credit_card do
    user_id { 1 }
    payjp_id { "MyString" }
    user
  end
end