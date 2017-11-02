require 'rails_helper'

describe Meal, :type => :model do
  describe ".new" do
    it "is not valid without a name" do
      meal = Meal.new(name: nil)
      expect(meal).to_not be_valid
    end

    it "is not valid without a byline" do
      meal = Meal.new(byline: nil)
      expect(meal).to_not be_valid
    end    
  end
end
