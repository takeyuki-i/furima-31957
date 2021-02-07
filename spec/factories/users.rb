FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {'t123456'}
    password_confirmation {password}
    first_name            {'伊藤'}
    last_name             {'博文'}
    first_name_kana       {'イトウ'}
    last_name_kana        {'ヒロブミ'}
    birthday              {'20000101'}
  end
end