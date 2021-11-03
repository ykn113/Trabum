FactoryBot.define do
  factory :post do
    country { Faker::Lorem.characters(number:20) }
    city { Faker::Lorem.characters(number:20) }
    flight { Faker::Lorem.characters(number:20) }
  end
end