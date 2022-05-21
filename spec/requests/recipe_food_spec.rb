require 'rails_helper'

RSpec.describe 'RecipeFood', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'Yaseer Okino', email: 'yaseerokinop@mail.com', password: '12345678') }
  let(:food) { user.foods.create(name: 'Rice', measurementUnit: 'grams', price: 500) }
  let(:recipe) do
    user.recipes.create(name: 'Rice with fish', cooking_time: 60, preparation_time: 30,
                        description: 'these are the description when cooking the meal', public: false)
  end
  describe 'GET /index' do
    before do
      sign_in user
      get new_recipe_recipe_food_path(recipe)
    end
    it 'should return response status correct (ok)' do
      expect(response).to have_http_status(:ok)
    end
    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
    it 'should include correct placeholder' do
      expect(response.body).to include('Add')
    end
  end
end
