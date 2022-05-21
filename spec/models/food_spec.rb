require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { User.create(name: 'Yaseer Okino', email: 'yaseerokinop@mail.com', password: '12345678') }
  let(:food) { user.foods.create(name: 'Rice', measurement_unit: 'grams', price: 500) }

  describe 'Food Validations' do
    context 'when valid' do
      it { expect(food).to be_valid }
    end

    it 'should allow valid name' do
      food.name = 'i'
      expect(food).to_not be_valid
    end

    it 'should allow valid name' do
      expect(food).to be_valid
    end

    it 'should validate measurment unit' do
      food.measurement_unit = nil
      expect(food).to_not be_valid
    end

    it 'should validate measurment unit' do
      expect(food).to be_valid
    end

    it 'should validate price' do
      food.price = -10
      expect(food).to_not be_valid
    end

    it 'should validate price' do
      expect(food).to be_valid
    end
  end
end
