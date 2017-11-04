require 'rails_helper'

describe OrdersController, :type => :request do
  it { should route(:get, '/orders').to(action: :index) }
  it do
    should route(:get, '/orders/GO676')
           .to(action: :show, order_id: 'GO676')
  end

  describe '#index' do
    let(:all_orders) { DeliveryOrder.all }
    setup do
      create(:delivery_order)
      get '/orders'
    end

    it { expect(response.header['Content-Type']).to match(/application\/json/) }
    it { expect(response.body).to eq({ orders: all_orders }.to_json) }
  end

  describe '#show' do
    context 'when order id is valid' do
      let(:new_delivery_order) { create(:delivery_order) }
      let(:new_meal) { create(:meal) }
      setup do
        create(
          :order_item,
          delivery_order_id: new_delivery_order.id,
          meal_id: new_meal.id
        )

        get "/orders/#{new_delivery_order.order_id}"
      end


      it { expect(response.header['Content-Type']).to match(/application\/json/) }
      it do
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

    context 'when order id is invalid' do
      setup { get "/orders/123" }

      it { expect(response.header['Content-Type']).to match(/application\/json/) }
      it { expect(response.status).to eq(400)}
      it do
        expect(response.body).to eq({
          status: 400,
          message: 'Order ID is invalid'
        }.to_json)
      end
    end
  end
end
