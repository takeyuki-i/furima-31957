FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'伊藤'}
    first_name            {'博文'}
    last_name_kana        {'イトウ'}
    first_name_kana       {'ヒロブミ'}
    birthday              {'20000101'}
  end
end