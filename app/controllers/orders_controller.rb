class OrdersController < ApplicationController
  def index
    @orders = DeliveryOrder
              .select(:order_id, :serving_datetime)
              .as_json(:except => [:id, :serving_datetime])

    render json: { "orders" => @orders }
    #json.orders @orders, :order_id, :serving_datetime
  end

  def show
    


    render html: "find order #{params[:order_id]}"
  end
end
