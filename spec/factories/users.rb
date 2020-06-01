FactoryBot.define do
  factory :user do
    family_name           {"内藤"}
    first_name            {"謙人"}
    family_name_kana      {"ないとう"}
    first_name_kana       {"けんと"}
    nickname              {"ナイケン"}
    introduction          {"よろしくお願いします。"}
    email                 {"aaa@gmail.com"}
    password              {"password"}
    password_confirmation {"password"}
    birth_year            {"2018"}
    birth_month           {"1"}
    birth_day             {"1"}
  end
end