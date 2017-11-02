class Meal < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :byline

  has_many :order_items, :dependent => :destroy
end
