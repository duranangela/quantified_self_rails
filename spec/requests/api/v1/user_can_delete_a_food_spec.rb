require 'rails_helper'

describe 'DELETE /api/v1/foods/:id' do
  it 'can delete a food from the db' do
    food = create(:food)

    delete "/api/v1/foods/#{food.id}"

    expect(response.status).to eq(204)
  end
end
