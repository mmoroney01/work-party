class Cleaning < ApplicationRecord
  has_many :cleaning_guests
  has_many :guests, through: :cleaning_guests
end
