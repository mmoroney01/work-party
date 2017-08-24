class Cleaning < ApplicationRecord
  has_many :cleaning_guests
  has_many :guests, through: :cleaning_guests

  validates :start_time, :location, null: false

  validates_presence_of :start_time, :location
end
