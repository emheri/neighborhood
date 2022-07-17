class Flat < ApplicationRecord
  scope :within_radius, -> (lat, lng, meter) { where('earth_box(ll_to_earth(?, ?), ?) @> ll_to_earth(latitude, longitude)', lat, lng, meter) }

  belongs_to :user

  has_many :neighboorhood_flats, class_name: 'NeighborhoodFlat', dependent: :delete_all
  has_many :neighborhoods, through: :neighboorhood_flats

  validates :name, presence: true
  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true
end
