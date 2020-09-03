FactoryBot.define do
  factory :user do
    nickname              {"タナカ"}
    email                 {"kkk@gmail.com"}
    password              {"tanaka123"}
    password_confirmation {password}
    family_name_kanji     {"田中"}
    first_name_kanji      {"太郎"}
    family_name_katakana  {"タナカ"}
    first_name_katakana   {"タロウ"}
    birthday              {1935-03-04}
  end
end