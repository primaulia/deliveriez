class Meal < ApplicationRecord
  has_many :order_items
end
