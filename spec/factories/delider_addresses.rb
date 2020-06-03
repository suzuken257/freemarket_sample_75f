FactoryBot.define do
  factory :deliver_address do
    family_name         {"山田"}
    first_name          {"太郎"}
    family_name_kana    {"やまだ"}
    first_name_kana     {"たろう"}
    zip_code            {"123-4567"}
    prefecture_id       {1}
    city                {"あああ"}
    address1            {"あああ"}
    apartment_address   {"あああ"}
    telephone           {"08011112222"}
    user_id             {1}
    user
  end
end
