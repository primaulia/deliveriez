class FeedbacksController < ApplicationController
  def index
    order = DeliveryOrder.find_by(order_id: params[:order_id])
    all_feedbacks_by_order_id = []
    all_feedbacks_by_order_id << Feedback.find_by(ratable_id: order.id)

    render json: {
      feedbacks: all_feedbacks_by_order_id
    }
  end

  def create
    feedbacks = params[:feedbacks]
    feedbacks.each do |feedback|
      Feedback.create(feedback.permit(:ratable_id, :ratable_type, :comment, :rating))
    end

    render json: {
      status: "OK"
    }
  end

  private


end
