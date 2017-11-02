# This will guess the User class
FactoryBot.define do
  factory :meal do
    name Faker::Food.dish
    byline Faker::Food.spice
  end
end
