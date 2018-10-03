require 'rails_helper'

describe 'PATCH /api/v1/foods/:id' do
  it 'can update a food in the db' do
    food = Food.create(name: 'Monte', calories: 25)
    payload = { "food": { "name": "Mint", "calories": "14"} }

    patch "/api/v1/foods/#{food.id}", params: payload

    expect(response).to be_successful

    food = JSON.parse(response.body)

    expect(food['id']).to eq(1)
    expect(food['name']).to eq('Mint')
    expect(food['calories']).to eq(14)
  end
  it 'returns a 400 if not successfully updated' do
    food = Food.create(name: 'Monte', calories: 25)
    payload = { "food": { 'field': 'something' } }
    patch "/api/v1/foods/#{food.id}", params: payload

    expect(response.status).to eq(400)
  end
end
