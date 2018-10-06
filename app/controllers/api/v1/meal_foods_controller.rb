class Api::V1::MealFoodsController < ApplicationController

  def create
    meal = Meal.find(params[:meal_id])
    food = Food.find(params[:id])
    mealfood = MealFood.create(meal_id: meal.id, food_id: food.id)
    render json: {message: "Successfully added #{food.name} to #{meal.name}"}
  end

end
