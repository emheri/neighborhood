class User < ApplicationRecord
  has_many :flats, dependent: :destroy
  has_many :neighborhoods, through: :flats
  
  validates :name, presence: true
  validates :email, presence: true, email: true, uniqueness: true
end
