require 'rails_helper'

describe OrderItem, :type => :model do
  let(:delivery_order_id) do
    DeliveryOrder.new(
      order_id: 'GO123',
      serving_datetime: Faker::Date.forward(30)
    )
  end

  let(:meal_id) do
    Meal.new(
      name: 'Buffalo Chicken on Sweet Potato Mash and Celery Confit',
      byline: 'charred cauliflower and tomato confit'
    )
  end

  subject do
    OrderItem.new(
      delivery_order_id: delivery_order_id,
      serving_date: Faker::Date.forward(30),
      meal_id: meal_id,
      quantity: rand(1..3),
      unit_price: rand(495...2000)
    )
  end

  describe '.new' do
    # it 'is valid with valid attributes' do
    #   expect(subject).to be_valid
    # end

    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_presence_of(:serving_date) }
  end

  describe 'association' do
    it { should belong_to(:delivery_order) }
    it { should belong_to(:meal) }
  end
end
