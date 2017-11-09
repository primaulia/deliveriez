class Feedback < ApplicationRecord
  belongs_to :ratable, polymorphic: true

  def as_json(options = {})
    options[:except] ||= [:id, :created_at, :updated_at]
    super(options)
  end
end
