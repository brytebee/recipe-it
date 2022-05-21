require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'Yaseer Okino', email: 'yaseerokinop@mail.com', password: '12345678')
  end
  before { subject.save }

  it 'name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should valid the name' do
    subject.name = 'Rida'
    expect(subject).to be_valid
  end
end
