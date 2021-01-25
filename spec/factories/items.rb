FactoryBot.define do
  factory :item do
    image                 { Faker::Lorem.sentence }
    name                  { '商品' }
    info                  { 'これは商品です。100cmです' }
    category_id           { '2' }
    status_id             { '2' }
    shipping_cost_id      { '2' }
    prefecture_id         { '2' }
    delivery_schedule_id  { '2' }
    price                 { '999' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
