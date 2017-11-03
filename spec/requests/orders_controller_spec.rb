require 'rails_helper'

describe OrdersController, :type => :request do
  it { should route(:get, '/orders').to(action: :index) }
  it { should route(:get, '/orders/GO676').to(action: :show, order_id: 'GO676') }


  describe '#index' do
    it 'should return json of all orders' do
      create(:delivery_order)
      all_orders = DeliveryOrder.all

      get '/orders'

      should respond_with(200)
      expect(response.header['Content-Type']).to eq('application/json')
      expect(response.body).to eq({ orders: all_orders }.to_json)
    end
  end

  describe '#show' do
    it 'should return json of one delivery order detail and related order items' do
      new_delivery_order = create(:delivery_order)
      new_meal = create(:meal)

      create(
          :order_item,
          delivery_order_id: new_delivery_order.id,
          meal_id: new_meal.id
      )

      get "/orders/#{new_delivery_order.order_id}"


      should respond_with(200)
      expect(response.body).to eq({
        order: {
          order_id: new_delivery_order.order_id,
          delivery_date: new_delivery_order.delivery_date,
          delivery_time: new_delivery_order.delivery_time,
          order_items: new_delivery_order.order_items.map do |item|
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
