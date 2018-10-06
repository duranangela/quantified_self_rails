class Api::V1::MealFoodsController < ApplicationController

  def create
    if Meal.exists?(params[:meal_id]) && Food.exists?(params[:id])
      meal = Meal.find(params[:meal_id])
      food = Food.find(params[:id])
      mealfood = MealFood.create(meal_id: meal.id, food_id: food.id)
      render json: {message: "Successfully added #{food.name} to #{meal.name}"}
    else
      render status: 404
    end
  end

  def destroy
    meal = Meal.find(params[:meal_id])
    food = Food.find(params[:id])
    mealfood = MealFood.where(meal_id: meal.id, food_id: food.id)
    MealFood.delete(mealfood)
    render json: {message: "Successfully removed #{food.name} from #{meal.name}"}
  end

end
