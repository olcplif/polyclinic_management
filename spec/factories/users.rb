# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    phone_number { Faker::Number.leading_zero_number(digits: 10) }
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    trait :invalid_user do
      phone_number { Faker::Lorem.characters(number: 9) }
      email { Faker::Lorem.characters(number: 5) }
      first_name { Faker::Lorem.characters(number: 2) }
      last_name { Faker::Lorem.characters(number: 1) }
    end
  end
end
