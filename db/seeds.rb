# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Meal.destroy_all
DeliveryOrder.destroy_all

10.times do
  Meal.create(
    name: Faker::Food.dish,
    byline: Faker::Food.spice
  )
end

5.times do
  random_date = Faker::Date.forward(30)
  delivery_slots = (0...6).to_a.sample

  DeliveryOrder.create(
    order_id: "GO#{rand(999)}",
    serving_datetime: random_date + 11.hours + (delivery_slots * 30).minutes
  )
end
