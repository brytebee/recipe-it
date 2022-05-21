require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) { User.create(name: 'Yaseer Okino', email: 'yaseerokinop@mail.com', password: '12345678') }
  let(:food) { user.foods.create(name: 'Rice', measurement_unit: 'grams', price: 500) }
  let(:recipe) do
    user.recipes.create(name: 'Rice with fish', cooking_time: 60, preparation_time: 30,
                        description: 'these are the description when cooking the meal', public: false)
  end
  let(:recipe_food) { RecipeFood.create(quantity: 20, food_id: food.id, recipe_id: recipe.id) }

  describe 'Recipe Food Validations' do
    context 'when valid' do
      it { expect(recipe_food).to be_valid }
    end

    it 'should allow valid quantity' do
      recipe_food.quantity = 'yaseer'
      expect(recipe_food).to_not be_valid
    end

    it 'should allow valid quantity' do
      recipe_food.quantity = -14
      expect(recipe_food).to_not be_valid
    end

    it 'should allow valid quantity' do
      expect(recipe_food).to be_valid
    end
  end
end
