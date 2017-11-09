class OrderItem < ApplicationRecord
  belongs_to :delivery_order
  belongs_to :meal
  # update 6 nov
  has_many :feedbacks, as: :ratable

  validates_presence_of :quantity
  validates_presence_of :unit_price
  validates_presence_of :serving_date

  # 8 Nov, new virtual attributes
  attribute :order_item_id, :integer
  attribute :meal_name, :string

  def order_item_id
    self.id
  end

  def meal_name
    self.meal.name
  end

  def as_json(options = {})
    options[:except] ||= [:order_item_id]

    super(options)
  end
end
