require 'rails_helper'

describe 'DELETE /api/v1/meals/:meal_id/foods/:id' do
  it 'can delete a food from a meal' do
    meal = create(:meal)
    food = create(:food)
    MealFood.create(meal_id: meal.id, food_id: food.id)

    delete "/api/v1/meals/#{meal.id}/foods/#{food.id}"

    expect(response).to be_successful

    msg = JSON.parse(response.body)

    expect(msg['message']).to eq("Successfully removed #{food.name} from #{meal.name}")
  end
end
