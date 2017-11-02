require 'rails_helper'

describe OrderItem, :type => :model do
  subject do
    random_order = DeliveryOrder.all.sample
    random_meal = Meal.all.sample
    OrderItem.new(
      delivery_order_id: random_order.id,
      serving_date: Faker::Date.forward(30),
      meal_id: random_meal.id,
      quantity: rand(1..3),
      unit_price: rand(495...2000)
    )
  end

  describe '.new' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_presence_of(:serving_date) }
  end

  describe 'association' do
    it { should belong_to(:delivery_order) }
    it { should belong_to(:meal) }
  end
end
