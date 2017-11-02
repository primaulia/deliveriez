require 'rails_helper'

describe DeliveryOrder, :type => :model do
  subject { DeliveryOrder.new() }

  describe ".new" do
    it "is not valid without a order_id" do
      delivery_order = DeliveryOrder.new(order_id: nil)
      expect(delivery_order).to_not be_valid
    end

    it "is not valid without a serving_datetime" do
      delivery_order = DeliveryOrder.new(serving_datetime: nil)
      expect(delivery_order).to_not be_valid
    end
  end
end
