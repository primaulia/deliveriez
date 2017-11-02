require 'rails_helper'

describe OrdersController, :type => :request do
  describe '#index' do
    it 'should return json of all orders' do
      FactoryBot.create(:delivery_order)
      all_orders = DeliveryOrder.all

      get '/orders'
      expect(response.body).to eq({ orders: all_orders }.to_json)
    end
  end

  describe '#show' do
    it 'should return json of one delivery order detail and related order items' do
      delivery_order = create(:delivery_order)
      new_meal = create(:meal)

      create(:order_item, delivery_order_id: delivery_order.id, meal_id: new_meal.id)

      get "/orders/#{delivery_order.order_id}"
      expect(response.body).to eq({
        order: {
          order_id: delivery_order.order_id,
          delivery_date: delivery_order.delivery_date,
          delivery_time: delivery_order.delivery_time,
          order_items: delivery_order.order_items.map do |item|
            {
              name: item.meal.name,
              quantity: item.quantity,
              total_price: item.unit_price * item.quantity
            }
          end
        }
      }.to_json)
    end
  end
end
