require 'rails_helper'

RSpec.describe Flat, type: :model do
  context "valid flat" do
    it 'should create flat with valid attributes' do
      flat = create(:flat)
      expect(flat).to be_valid 
    end
    
    it "should increment for user flats count" do
      flat = build(:flat)
      expect{flat.save}.to change{flat.user.flats.count}.by(1)
    end
  end
  
  context 'validations' do
    it 'is not valid without user' do
      flat = Flat.create({name: Faker::Restaurant.name, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude})
      expect(flat).to_not be_valid
    end

    it 'is not valid without a name' do
      user = create(:user)
      flat = user.flats.create({name: nil, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude})
      expect(flat).to_not be_valid
    end

    it 'is not valid without a latitude' do
      user = create(:user)
      flat = user.flats.create({name: Faker::Restaurant.name, latitude: nil, longitude: Faker::Address.longitude})
      expect(flat).to_not be_valid
    end

    it 'is not valid without a longitude' do
      user = create(:user)
      flat = user.flats.create({name: Faker::Restaurant.name, latitude: Faker::Address.latitude, longitude: nil})
      expect(flat).to_not be_valid
    end

    it 'is not valid when latitude and longitude is not numeric' do
      user = create(:user)
      flat = user.flats.create({name: Faker::Restaurant.name, latitude: Faker::Address.street_name, longitude: Faker::Address.street_name})
      expect(flat).to_not be_valid
    end
    
  end
end
