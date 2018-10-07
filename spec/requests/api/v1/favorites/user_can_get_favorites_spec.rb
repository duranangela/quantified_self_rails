require 'rails_helper'

describe 'GET /api/v1/favorite_foods' do
  it 'can get a list of favorite_foods' do
    food1 = create(:food)
    food2 = create(:food)
    food3 = create(:food)
    meal1 = create(:meal)
    meal2 = create(:meal)
    meal3 = create(:meal)
    MealFood.create(meal_id: meal1.id, food_id: food1.id)
    MealFood.create(meal_id: meal2.id, food_id: food1.id)
    MealFood.create(meal_id: meal3.id, food_id: food1.id)
    MealFood.create(meal_id: meal1.id, food_id: food2.id)
    MealFood.create(meal_id: meal2.id, food_id: food2.id)
    MealFood.create(meal_id: meal3.id, food_id: food3.id)

    get "/api/v1/favorite_foods"

    expect(response).to be_successful

    foods = JSON.parse(response.body)

    expect(foods[0]['timesEaten']).to eq(3)
    expect(foods[0]['foods'][0]['name']).to eq(food1.name)
    expect(foods[0]['foods'][0]['calories']).to eq(food1.calories)
    expect(foods[0]['foods'][0]['mealWhenEaten']).to eq(food1.meals.pluck(:name).uniq)
  end
end
