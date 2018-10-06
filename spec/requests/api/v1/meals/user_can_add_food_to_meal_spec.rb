require 'rails_helper'

describe 'POST /api/v1/meals/:meal_id/foods/:id' do
  it 'can add existing food to existing meal' do
    meal = create(:meal)
    food = create(:food)

    post "/api/v1/meals/#{meal.id}/foods/#{food.id}"

    expect(response).to be_successful

    response = JSON.parse(response.body)

    expect(response['message']).to eq("Successfully added #{food.name} to #{meal.name}")
  end
end
