require 'rails_helper'

describe 'GET /api/v1/foods/:id' do
  it 'can get one food by id' do
    food = create(:food)

    get "/api/v1/foods/#{food.id}"
    expect(response).to be_successful

    food = JSON.parse(response.body)

    expect(food['id']).to eq(1)
    expect(food['name']).to be_a(String)
    expect(food['calories']).to be_a(Integer)
  end
  it 'renders a 404 if food id not found' do
    get "/api/v1/foods/1"

    expect(response.status).to eq(404)
  end
end
