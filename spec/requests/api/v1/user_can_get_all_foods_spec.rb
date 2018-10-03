require 'rails_helper'

describe 'GET /api/v1/foods' do
  it 'can get a list of all foods in db' do
    create_list(:food, 3)

    get '/api/v1/foods'

    expect(response).to be_successful

    foods = JSON.parse(response.body)

    expect(foods.count).to eq(3)
  end
end
