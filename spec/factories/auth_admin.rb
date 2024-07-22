FactoryBot.define do
  factory :auth_admin do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end