require 'rails_helper'

describe 'POST /api/v1/meals/:meal_id/foods/:id' do
  it 'can add existing food to existing meal' do
    meal = create(:meal)
    food = create(:food)

    post "/api/v1/meals/#{meal.id}/foods/#{food.id}"

    expect(response).to be_successful

    msg = JSON.parse(response.body)

    expect(msg['message']).to eq("Successfully added #{food.name} to #{meal.name}")
  end
  it 'returns 404 if meal or food not found' do
    post "/api/v1/meals/1/foods/1"

    expect(response.status).to eq(404)
  end
end
