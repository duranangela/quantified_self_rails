require 'rails_helper'

describe "GET /api/v1/meals" do
  it 'can get a list of all meals and associated foods' do
    breakfast = Meal.create(name: 'Breakfast')
    lunch = Meal.create(name: 'Lunch')
    food1 = create(:food)
    food2 = create(:food)
    food3 = create(:food)
    MealFood.create(meal_id: breakfast.id, food_id: food1.id)
    MealFood.create(meal_id: breakfast.id, food_id: food2.id)
    MealFood.create(meal_id: lunch.id, food_id: food2.id)
    MealFood.create(meal_id: lunch.id, food_id: food3.id)

    get "/api/v1/meals"
    expect(response).to be_successful

    meals = JSON.parse(response.body)

    expect(meals[0]['id']).to eq(1)
    expect(meals[0]['name']).to eq('Breakfast')
    expect(meals[0]['foods'][0]['id']).to eq(1)
    expect(meals[0]['foods'][0]['name']).to be_a(String)
    expect(meals[0]['foods'][0]['calories']).to be_a(Integer)
  end
end
