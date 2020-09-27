class Space < ApplicationRecord
  has_many :reservations
  has_many :events, through: reservations

  validates :space_name
end
