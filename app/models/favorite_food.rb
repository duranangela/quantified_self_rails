class FavoriteFood

  def initialize
  end

  def times_eaten
    timesEatenArray = []
    simplified.each {|k,v|
      hash = {}
      hash['timesEaten'] = k
      hash['foods'] = foods(v)
      timesEatenArray << hash
    }
    timesEatenArray
  end

  private

  def count_hash
    MealFood.group(:food_id)
    .order('count_id desc')
    .count('id')
    .delete_if{|k,v| v < 2}
    .group_by{|foodid, count| count}
  end

  def simplified
    count_hash.each_with_object({}){|(k,v), hash|
      hash[k] = (v.map{|x| x[0]})
    }
  end

  def foods(array)
    foods = []
    array.map{|x|
      hash = {}
      food = Food.find(x)
      hash['name'] = food.name
      hash['calories'] = food.calories
      hash['mealWhenEaten'] = food.meals.pluck(:name).uniq
      foods << hash
    }
    foods
  end

end
