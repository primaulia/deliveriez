# This will guess the User class
FactoryBot.define do
  factory :order_item do
    delivery_order_id nil
    serving_date Faker::Date.forward(30)
    meal_id nil
    quantity { rand(1..3) }
    unit_price { rand(495...2000) }
  end
end
