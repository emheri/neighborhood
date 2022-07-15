FactoryBot.define do
  factory :flat do
    user { association :user }
    name { Faker::Restaurant.name }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
  