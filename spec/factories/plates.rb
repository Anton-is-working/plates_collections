FactoryBot.define do
  factory :plate do
    title { Faker::Food.dish }
    order { rand(1..10) }
    association :collection
  end
end