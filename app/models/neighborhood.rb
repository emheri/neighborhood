class Neighborhood < ApplicationRecord
  has_many :neighborhood_flats, class_name: 'NeighborhoodFlat', dependent: :delete_all
  has_many :flats, through: :neighborhood_flats
  has_many :users, through: :flats

  validates :name, presence: true
  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true
  validates :radius, presence: :true, numericality: true

  after_create :set_nearest_flats
  
  # get nearest flat based on radius meters
  def find_nearest_flats
    Flat.within_radius(self.latitude, self.longitude, self.radius)
  end
  
  private

  def set_nearest_flats
    find_nearest_flats.each do |flat|
      self.neighborhood_flats.create!(flat: flat)
    end    
  end
  
end
