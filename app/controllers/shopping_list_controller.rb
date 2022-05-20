class ShoppingListController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = RecipeFood.all
    @food = Food.all
    @total_price = calculate_sum(@recipe.recipe_foods.includes([:food]))
  end

  def calculate_sum(array)
    sum = 0
    array.each do |num|
      sum += num.quantity * num.food.price
    end
    sum
  end
end
