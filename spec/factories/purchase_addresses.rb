FactoryBot.define do
  factory :purchase_address do
    token                 { Faker::Internet.password }
    postal_code           { "000-0000" }
    shipping_origin_id    { Faker::Number.between(from: 2, to: 48) }
    city                  { Gimei.city.kanji }
    block_num             { Faker::Number.number(digits: 3) }
    phone_num             { Faker::Number.number(digits: 11) }
  end
end
