class DeliveryOrder < ApplicationRecord
  attr_reader :delivery_date, :delivery_time

  def delivery_date
    "test"
  end

  def delivery_time
    "test2"
  end
end
