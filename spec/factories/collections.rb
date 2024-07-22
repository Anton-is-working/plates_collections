FactoryBot.define do
  factory :collection do
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph }
    publish { [true, false].sample }
  end
end
