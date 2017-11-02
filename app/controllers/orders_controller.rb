class OrdersController < ApplicationController
  def index
    @orders = DeliveryOrder
              .select(:order_id, :serving_datetime)

    render json: { "orders" => @orders }
  end

  def show
    @order = DeliveryOrder
             .select(:order_id, :serving_datetime)
             .where(order_id: params[:order_id])

    render json: { "order" => @order.first }
  end
end
