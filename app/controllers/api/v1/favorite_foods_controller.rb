class Api::V1::FavoriteFoodsController < ApplicationController

  def index
    favorite_food = FavoriteFood.new
    render json: favorite_food.times_eaten
  end

end
