class Meal < ApplicationRecord
  has_many :order_items, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :byline
end
