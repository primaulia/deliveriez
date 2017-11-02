class OrderItem < ApplicationRecord
  belongs_to :delivery_order
  belongs_to :meal

  validates_presence_of :quantity
  validates_presence_of :unit_price
  validates_presence_of :serving_date
end
