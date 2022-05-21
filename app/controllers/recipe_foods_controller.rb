class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.create(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to @recipe, notice: 'Ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    respond_to do |format|
      if @recipe_food.update(recipe_food_params)
        format.html { redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Recipe food was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Recipe food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
