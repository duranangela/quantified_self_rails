require 'rails_helper'

describe 'POST /api/v1/foods' do
  it 'can create new food' do
    json_payload = { "food": { "name": "Apple", "calories": "220"} }.to_json
    post "/api/v1/foods", params: json_payload


    expect(response).to be_successful

    food = JSON.parse(response.body)

    expect(food['id']).to eq(1)
    expect(food['name']).to be_a('Apple')
    expect(food['calories']).to be_a(220)

  end
end
