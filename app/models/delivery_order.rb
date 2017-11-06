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

  def delivery_date
    self.serving_datetime.strftime('%Y-%m-%d')
  end

  def delivery_time
    start_time = self.serving_datetime.strftime('%H:%M')
    end_time = (self.serving_datetime + 30.minutes).strftime('%H:%M')
    "#{start_time}-#{end_time}"
  end

  # customize json serializer so model will automatically show only order_id
  def as_json(options = {})
    options[:only] ||= [:order_id, :delivery_date, :delivery_time]
    super(options)
  end
end
