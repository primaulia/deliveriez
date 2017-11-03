class OrderItem < ApplicationRecord
  belongs_to :delivery_order
  belongs_to :meal

  validates_presence_of :quantity
  validates_presence_of :unit_price
  validates_presence_of :serving_date

  # customize json serializer so model will automatically show only order_id
  # not covering this, because we've covered the json output already
  # :nocov:
  def as_json(options = {})
    options[:only] ||= [:order_id, :delivery_date, :delivery_time]
    super(options)
  end
  # :nocov:
end
