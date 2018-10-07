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
    binding.pry


  end
end
