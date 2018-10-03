class Api::V1::FoodsController < ApplicationController

  def index
    render json: Food.all
  end

  def show
    if Food.exists?(params[:id])
      render json: Food.find(params[:id])
    else
      render status: 404
    end
  end

  def create
    food = Food.new(name: params[:food][:name], calories: params[:food][:calories].to_i)
    if food.save
      render json: food
    else
      render status: 400
    end
  end

end
