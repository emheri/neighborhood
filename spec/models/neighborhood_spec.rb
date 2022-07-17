require 'rails_helper'

RSpec.describe Neighborhood, type: :model do
  context 'valid neighborhood' do
    it 'should create valid neighborhood' do
      neighborhood = create(:neighborhood)
      expect(neighborhood).to be_valid  
    end

    it 'have neighborhood flats' do
      flat_1 = create(:flat, :poppies_1)
      flat_2 = create(:flat, :poppies_2)
      neighborhood = create(:neighborhood, :poppies)
      expect(neighborhood).to be_valid
      flat_1.reload
      flat_2.reload
      neighborhood.reload
      expect(neighborhood.flats.count).to eq(2)
      expect(flat_1.neighborhoods.count).to eq(1)
      expect(flat_1.neighborhoods.count).to eq(1)
    end
  end

  context 'validations' do
    it 'is not valid without a name' do
      neighborhood = Neighborhood.create({name: nil, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude, radius: 1000})
      expect(neighborhood).to_not be_valid
      expect(neighborhood).to have(1).error_on(:name)
    end

    it 'is not valid without a latitude' do
      neighborhood = Neighborhood.create({name: Faker::Name.name, latitude: nil, longitude: Faker::Address.longitude, radius: 1000})
      expect(neighborhood).to_not be_valid
      expect(neighborhood).to have(2).error_on(:latitude)
    end

    it 'is not valid without a longitude' do
      neighborhood = Neighborhood.create({name: Faker::Name.name, latitude: Faker::Address.latitude, longitude: nil, radius: 1000})
      expect(neighborhood).to_not be_valid
      expect(neighborhood).to have(2).error_on(:longitude)
    end

    it 'is not valid without radius' do
      neighborhood = Neighborhood.create({name: Faker::Name.name, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude, radius: nil})
      expect(neighborhood).to_not be_valid
      expect(neighborhood).to have(2).error_on(:radius)
    end

    it 'is not valid when latitude and longitude is not numeric' do
      neighborhood = Neighborhood.create({name: Faker::Restaurant.name, latitude: Faker::Address.street_name, longitude: Faker::Address.street_name, radius: 1000})
      expect(neighborhood).to_not be_valid
      expect(neighborhood).to have(1).error_on(:latitude)
      expect(neighborhood).to have(1).error_on(:longitude)
    end

    it 'is not valid when radius is not numeric' do
      neighborhood = Neighborhood.create({name: Faker::Name.name, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude, radius: 'radius'})
      expect(neighborhood).to_not be_valid
      expect(neighborhood).to have(1).error_on(:radius)
    end
    
  end
end
