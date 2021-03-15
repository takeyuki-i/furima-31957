FactoryBot.define do
  factory :product_buy do
    price             { 60_000 }
    token             { 'tok_abcdefghijk00000000000000000' }
    zip_code          { '111-1111' }
    delivery_area_id  { 2 }
    city              { 'さいたま市' }
    addres1           { '大宮1-1' }
    addres2           { '大宮ビル' }
    tell_num          { '09012345678' }
  end
end
