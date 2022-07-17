# frozen_string_literal: true

class NeighborhoodFlat < ApplicationRecord
  belongs_to :flat
  belongs_to :neighborhood
end
