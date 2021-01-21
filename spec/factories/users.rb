FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"abc000"}
    password_confirmation {password}
    last_name             {"小林"}
    first_name            {"太郎"}
    last_kana             {"コバヤシ"}
    first_kana            {"タロウ"}
    birthday              {"2020-01-01"}
  end
end