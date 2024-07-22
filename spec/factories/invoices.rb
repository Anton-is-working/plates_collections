# frozen_string_literal: true

FactoryBot.define do
  factory :invoice do
    name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    email { Faker::Internet.email }
    from { rand(1..10) }
  end
end
