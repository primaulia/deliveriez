# This will guess the User class
FactoryBot.define do
  factory :delivery_order do
    order_id { "GO#{rand(999)}" }
    serving_datetime Faker::Date.forward(30)
  end
end
