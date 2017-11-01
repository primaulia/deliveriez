class OrdersController < ApplicationController
  def index
    @orders = DeliveryOrder
              .select(:order_id, :serving_datetime)
              .as_json(:except => [:id, :serving_datetime])

    render json: { "orders" => @orders }
  end

  def show
    @order = DeliveryOrder
             .select(:order_id, :serving_datetime)
             .joins(:order_item)
             .where(order_id: params[:order_id])
             .as_json(:except => [:id, :serving_datetime])



    render json: { "order" => @order.first }
  end
end
