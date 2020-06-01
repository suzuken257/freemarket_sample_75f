FactoryBot.define do
  factory :deliver_address do
    content {Faker::Lorem.sentence}
    user
  end
end