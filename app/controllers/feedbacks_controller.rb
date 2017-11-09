class FeedbacksController < ApplicationController
  def index
    order = DeliveryOrder.find_by(order_id: params[:order_id])
    order_items = order.order_items

    if order.feedback.nil?
      order_items_output = order_items.map do |item|
        {
          order_item_id: item.id,
          name: item.meal.name,
          quantity: item.quantity,
          total_price: item.unit_price * item.quantity
        }
      end

      feedback_output = [{
        ratable_id: order.id,
        ratable_type: 'DeliveryOrder',
        rating: 0,
        comment: ''
      }]

      order_item.each do |item|
        feedback_output << {
          ratable_id: item.id,
          ratable_type: 'OrderItem',
          rating: 0,
          comment: ''
        }
      end

      # TODO: May need to refactor this
      output = {
        id: order.id,
        order_id: order.order_id,
        delivery_date: order.delivery_date,
        delivery_time: order.delivery_time,
        delivery_date_modal: order.delivery_date_erb,
        delivery_time_modal: order.delivery_time_erb,
        order_items: order_items_output,
        feedbacks: feedback_output
      }

      render json: output
    else
      render json: {
        order: order,
        order_items: order_items,
        feedback: order.feedback
      }
    end


    # all_feedbacks_by_order_id = []
    # all_feedbacks_by_order_id << Feedback.find_by(ratable_id: order.id)
    #
    # render json: {
    #   feedbacks: all_feedbacks_by_order_id
    # }
  end

  def create
    feedbacks = params[:feedbacks]
    feedbacks.each do |feedback|
      Feedback.create(
        feedback.permit(:ratable_id, :ratable_type, :comment, :rating)
      )
    end

    render json: {
      status: "OK"
    }
  end

  private

  def feedback_params

  end
end
