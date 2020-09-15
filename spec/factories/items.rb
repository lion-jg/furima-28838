FactoryBot.define do
  factory :item do
    item_name               { Faker::Name.initials(number: 2) }
    detail                  { Faker::Lorem.sentence }
    category_id             { Faker::Number.between(from: 2, to: 11) }
    item_condition_id       { Faker::Number.between(from: 2, to: 7) }
    delivery_fee_id         { Faker::Number.between(from: 2, to: 3) }
    shipping_origin_id      { Faker::Number.between(from: 2, to: 48) }
    shipping_leadtime_id    { Faker::Number.between(from: 2, to: 4) }
    price                   { Faker::Number.between(from: 300, to: 9999999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
