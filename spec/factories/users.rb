FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {Faker::Internet.free_email}
    password              {"abc000"}
    password_confirmation {password}
    last_name             {"小林"}
    first_name            {"太郎"}
    last_kana             {"コバヤシ"}
    first_kana            {"タロウ"}
    birthday              {"2020-01-01"}
  end
end