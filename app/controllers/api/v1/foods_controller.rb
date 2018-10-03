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

  def update
    food = Food.update(params[:id], name: params[:food][:name], calories: params[:food][:calories].to_i)
    if food.save
      render json: food
    else
      render status: 400
    end
  end

  def destroy
    if Food.exists?(params[:id])
      Food.find(params[:id]).delete
      render status: 204
    else
      render status: 404
    end
  end

end
