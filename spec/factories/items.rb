FactoryBot.define do
  factory :item do
    name             { Faker::Lorem.sentence }
    text             { Faker::Lorem.sentence }
    category_id      { '2' }
    state_id         { '2' }
    delivery_fee_id  { '2' }
    delivery_area_id { '2' }
    delivery_time_id { '2' }
    price            { '1000000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
