class User < ApplicationRecord
  has_many :flats, dependent: :destroy
  
  validates :name, presence: true
  validates :email, presence: true, email: true, uniqueness: true
end
