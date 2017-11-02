class OrdersController < ApplicationController
  def index
    @orders = DeliveryOrder.all
    render json: { "orders" => @orders }
  end

  def show
    @order = DeliveryOrder
             .find_by(order_id: params[:order_id])

    @order_item = @order.order_items

    # TODO: REFACTOR THIS
    output = {
      order: {
        order_id: @order.order_id,
        delivery_date: @order.delivery_date,
        delivery_time: @order.delivery_time,
        order_items: @order_item.map do |item|
          {
            name: item.meal.name,
            quantity: item.quantity,
            total_price: item.unit_price * item.quantity
          }
        end
      }
    }



    render json: output
  end
end
