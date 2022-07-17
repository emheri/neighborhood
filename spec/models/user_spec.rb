# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should create user with valid attributes' do
    user = create(:user)
    expect(user).to be_valid
  end

  context 'validations' do
    it 'is not valid without a name' do
      user = User.create({ name: nil, email: Faker::Internet.email })
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user = User.create({ name: Faker::Name.name, email: nil })
      expect(user).to_not be_valid
    end

    it 'is not valid without a correct email' do
      user = User.create({ name: Faker::Name.name, email: 'not_valid_email' })
      expect(user).to_not be_valid
    end

    it 'should have unique email' do
      user_1 = create(:user)
      user_2 = User.create({ name: Faker::Name.name, email: user_1.email })
      expect(user_2).to_not be_valid
    end
  end
end
