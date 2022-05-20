require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create(name: 'Yaseer Okino', email: 'yaseerokinop@mail.com', password: '12345678') }
  let(:recipe) do
    user.recipes.create(name: 'Rice with fish', cooking_time: 60, preparation_time: 30,
                        description: 'these are the description when cooking the meal', public: false)
  end

  describe 'Recipe Validations' do
    context 'when valid' do
      it { expect(recipe).to be_valid }
    end

    it 'should allow valid name of the recipe' do
      recipe.name = nil
      expect(recipe).to_not be_valid
    end

    it 'should allow valid name' do
      recipe.name = 'Cake mm'
      expect(recipe).to be_valid
    end

    it 'should validate the cooking time' do
      recipe.cooking_time = -20
      expect(recipe).to_not be_valid
    end

    it 'should validate the cooking time' do
      expect(recipe).to be_valid
    end

    it 'should validate the preparation time' do
      recipe.preparation_time = -12.6
      expect(recipe).to_not be_valid
    end

    it 'should validate the preparation time' do
      expect(recipe).to be_valid
    end

    it 'should validate the description' do
      expect(recipe).to be_valid
    end

    it 'should validate the description' do
      recipe.description = 'soem wdescriptions' * 300
      expect(recipe).to_not be_valid
    end

    it 'should validate the public status' do
      expect(recipe).to be_valid
    end

    it 'should validate the public status' do
      recipe.public = nil
      expect(recipe).to_not be_valid
    end
  end
end
