require 'rails_helper'

describe Meal, :type => :model do
  subject do
    Meal.new(
      name: 'Buffalo Chicken on Sweet Potato Mash and Celery Confit',
      byline: 'charred cauliflower and tomato confit'
    )
  end

  describe '.new' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:byline) }
  end

  describe 'association' do
    it { should have_many(:order_items) }
  end
end
