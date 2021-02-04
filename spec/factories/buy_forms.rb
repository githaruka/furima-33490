FactoryBot.define do
  factory :buy_form do
    postal_code           { '000-0000' }
    prefecture_id         { 2 }
    city                  { '横浜市緑区' }
    address               { '青山1-1-1' }
    building              { '青山ビル3F'}
    phone_number          { '08000000000' }
    token                 { 'tok_abcdefghijk00000000000000000' }
  end
end
