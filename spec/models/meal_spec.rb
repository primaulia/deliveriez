require 'rails_helper'

RSpec.describe Meal, :type => :model do
  it "is not valid without a name" do
    meal = Meal.new(name: nil)
    expect(meal).to_not be_valid
  end

  it "is not valid without a byline" do
    meal = Meal.new(byline: nil)
    expect(meal).to_not be_valid
  end
end
