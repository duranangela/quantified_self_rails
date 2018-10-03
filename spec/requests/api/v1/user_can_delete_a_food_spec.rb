require 'rails_helper'

describe 'DELETE /api/v1/foods/:id' do
  it 'can delete a food from the db' do
    food = create(:food)

    delete "/api/v1/foods/#{food.id}"

    expect(response.status).to eq(204)

    expect(Food.count).to eq(0)
  end
  it 'renders a 404 if food id not found' do
    delete "/api/v1/foods/1"

    expect(response.status).to eq(404)
  end
end
