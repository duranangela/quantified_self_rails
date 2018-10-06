require 'rails_helper'

describe 'GET /api/v1/meals/:meal_id/foods' do
  it 'can get one meal by id with associated foods' do
    breakfast = create(:meal)
    food1 = create(:food)
    food2 = create(:food)
    MealFood.create(meal_id: breakfast.id, food_id: food1.id)
    MealFood.create(meal_id: breakfast.id, food_id: food2.id)

    get "/api/v1/meals/1/foods"

    meal = JSON.parse(response.body)

    expect(meal['id']).to eq(breakfast.id)
    expect(meal['name']).to eq(breakfast.name)
    expect(meal['foods'][0]['id']).to eq(food1.id)
    expect(meal['foods'][0]['name']).to eq(food1.name)
    expect(meal['foods'][0]['calories']).to eq(food1.calories)
  end
end
