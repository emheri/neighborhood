# frozen_string_literal: true

FactoryBot.define do
  factory :flat do
    user { association :user }
    name { Faker::Restaurant.name }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }

    trait :poppies_1 do
      user { association :user }
      name { Faker::Restaurant.name }
      latitude { -8.719566381747354 }
      longitude { 115.17129171363597 }
    end

    trait :poppies_2 do
      user { association :user }
      name { Faker::Restaurant.name }
      latitude { -8.720610956419382 }
      longitude { 115.17222244010074 }
    end
  end
end
