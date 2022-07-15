class Flat < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true
end
