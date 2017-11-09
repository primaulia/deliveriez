class DeliveryOrder < ApplicationRecord
  has_many :order_items, :dependent => :destroy
  # new update 6 Nov
  has_one :feedback, as: :ratable

  validates_presence_of :order_id
  validates_presence_of :serving_datetime

  # custom attributes derived from :serving_datetime
  # so we can display date and time separately
  attribute :delivery_date, :string
  attribute :delivery_time, :string

  # 6 nov new virtual attribute to match the json structure
  attribute :feedback_submitted, :boolean

  def delivery_date
    self.serving_datetime.strftime('%Y-%m-%d')
  end

  def delivery_date_erb
    self.serving_datetime.strftime('%B %e')
  end

  def delivery_time
    start_time = self.serving_datetime.strftime('%H:%M')
    end_time = (self.serving_datetime + 30.minutes).strftime('%H:%M')
    "#{start_time}-#{end_time}"
  end

  def delivery_time_erb
    start_time = self.serving_datetime.strftime('%l:%M%p')
    "#{start_time}"
  end

  def feedback_submitted
    ! self.feedback.nil?
  end

  # customize json serializer so model will automatically show only order_id, delivery_date, and delivery_time

  # 8 nov, update as per json updates
  def as_json(options = {})
    options[:only] ||= [:id, :order_id, :delivery_date, :delivery_time, :feedback_submitted]
    options[:include] = {
      order_items: { only: [:order_item_id, :meal_name] }
    }

    super(options)
  end
end
