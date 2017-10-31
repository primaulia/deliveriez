class OrdersController < ApplicationController
  def index
    @orders = DeliveryOrder.all
    # .select(:order_id, :serving_datetime).as_json(:except => :id)

    render json: { "orders" => @orders }
    #json.orders @orders, :order_id, :serving_datetime
  end
end
