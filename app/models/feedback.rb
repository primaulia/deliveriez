class Feedback < ApplicationRecord
  belongs_to :ratable, polymorphic: true
end
