FactoryBot.define do
  factory :item do
    name             { Faker::Lorem.sentence }
    text             { Faker::Lorem.sentence }
    category_id      { Faker::Number.between(2, 11) }
    state_id         { Faker::Number.between(2, 48) }
    delivery_fee_id  { Faker::Number.between(2, 3) }
    delivery_area_id { Faker::Number.between(2, 7) }
    delivery_time_id { Faker::Number.between(2, 4) }
    price            { Faker::Number.between(300, 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
