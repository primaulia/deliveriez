class Meal < ApplicationRecord
  validates_presence_of :name, :message => "Name can't be blank"
  validates_presence_of :byline, :message => "Byline can't be blank"

  has_many :order_items
end
