require 'rails_helper'

describe 'POST /api/v1/foods' do
  it 'can create new food' do
    payload = { "food": { "name": "Apple", "calories": "220"} }
    post "/api/v1/foods", params: payload

    expect(response).to be_successful

    food = JSON.parse(response.body)

    expect(food['id']).to eq(1)
    expect(food['name']).to eq('Apple')
    expect(food['calories']).to eq(220)
  end
  it 'returns 400 if not successful' do
    payload = { "food": { "calories": 220 } }
    post "/api/v1/foods", params: payload

    expect(response.status).to eq(400)
  end
end
