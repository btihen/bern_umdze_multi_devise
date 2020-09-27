class Event < ApplicationRecord
  has_many :reservations
  has_many :spaces, through: reservations

  validates :space_name
end
