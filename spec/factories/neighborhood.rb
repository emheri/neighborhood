FactoryBot.define do
  factory :neighborhood do
    name { Faker::Name.name }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    radius { 5000 }

    trait :poppies do
      name { 'Poppies Lane' }
      latitude { -8.720952473318535 }
      longitude { 115.17296906581674 }
      radius { 1000 }
    end
  end
end
  