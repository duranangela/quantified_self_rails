require 'rails_helper'

describe "GET /api/v1/meals" do
  it 'can get a list of all meals and associated foods' do
    breakfast = Meal.create(name: 'Breakfast')
    lunch = Meal.create(name: 'Lunch')
    dinner = Meal.create(name: 'Dinner')

  end
end
