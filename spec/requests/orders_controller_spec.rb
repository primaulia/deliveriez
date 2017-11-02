require 'rails_helper'

describe OrdersController, :type => :request do
  describe '#index' do
    it 'should return a json of all orders' do
      FactoryBot.create(:delivery_order)
      all_orders = DeliveryOrder
                    .select(:order_id, :serving_datetime)

      get '/orders'
      expect(response.body).to eq({ orders: all_orders }.to_json)
    end
  end
end
