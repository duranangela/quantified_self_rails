class Api::V1::MealsController < ApplicationController

  def index
    render json: Meal.all
  end

  def show
    if Meal.exists?(params[:meal_id])
      render json: Meal.find(params[:meal_id])
    else
      render status: 404
    end
  end

end
