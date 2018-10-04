require 'rails_helper'

describe 'GET /api/v1/foods' do
  it 'can get a list of all foods in db' do
    create_list(:food, 3)

    get '/api/v1/foods'

    expect(response).to be_successful

    foods = JSON.parse(response.body)

    expect(foods.count).to eq(3)
    expect(foods[0]['id']).to eq(1)
    expect(foods[0]['name']).to be_a(String)
    expect(foods[0]['calories']).to be_a(Integer)
  end
end
