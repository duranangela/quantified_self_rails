require 'rails_helper'

describe 'GET /api/v1/foods/:id' do
  it 'can get one food by id' do
    food = create(:food)

    get "/api/v1/foods/#{food.id}"

    expect(response).to be_successful

    food = JSON.parse(response.body)

    expect(foods[0]['id']).to eq(1)
    expect(foods[0]['name']).to be_a(String)
    expect(foods[0]['calories']).to be_a(Integer)
  end
end
