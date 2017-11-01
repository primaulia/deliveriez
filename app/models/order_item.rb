class OrderItem < ApplicationRecord
  belongs_to :delivery_order
  belongs_to :meal
end
