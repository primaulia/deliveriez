class OrdersController < ApplicationController
  def index
    @orders = DeliveryOrder.all

    respond_to do |format|
      format.html
      format.json { render json: {
        "orders" => @orders
      } }
    end
  end

  def show
    # check validity of params[:order_id]
    unless DeliveryOrder.exists?(order_id: params[:order_id])
      return render json: { status: 400, message: 'Order ID is invalid' },
                    status: 400
    end

    @order = DeliveryOrder.find_by(order_id: params[:order_id])
    @order_item = @order.order_items

    order_items_output = @order_item.map do |item|
      {
        order_item_id: item.id,
        name: item.meal.name,
        quantity: item.quantity,
        total_price: item.unit_price * item.quantity
      }
    end

    # TODO: May need to refactor this
    output = {
      id: @order.id,
      order_id: @order.order_id,
      delivery_date: @order.delivery_date,
      delivery_time: @order.delivery_time,
      delivery_date_modal: @order.delivery_date_erb,
      delivery_time_modal: @order.delivery_time_erb,
      order_items: order_items_output
    }

    respond_to do |format|
      format.html
      format.json { render json: output }
    end
  end
end
