require 'rails_helper'

describe DeliveryOrder, :type => :model do
  subject do
    DeliveryOrder.new(
      order_id: 'GO123',
      serving_datetime: Faker::Date.forward(30)
    )
  end

  describe '.new' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it { should validate_presence_of(:order_id) }
    it { should validate_presence_of(:serving_datetime) }
  end

  describe 'associations' do
    it { should have_many(:order_items) }
  end
end
