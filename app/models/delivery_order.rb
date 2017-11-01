class DeliveryOrder < ApplicationRecord
  # has_many :order_items

  has_many :order_items, :class_name => "OrderItem"


  attribute :delivery_date, :string
  attribute :delivery_time, :string

  def delivery_date
    self.serving_datetime.strftime('%Y-%m-%d')
  end

  def delivery_time
    start_time = self.serving_datetime.strftime('%H:%M')
    end_time = (self.serving_datetime + 30.minutes).strftime('%H:%M')
    "#{start_time}-#{end_time}"
  end
end
