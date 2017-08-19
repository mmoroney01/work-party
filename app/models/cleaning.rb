class Cleaning < ApplicationRecord
  has_many :cleaning_guests
  has_many :guests, through: :cleaning_guests

  validates :start_time, null: false
  validates :location, null: false

  validates_presence_of :start_time, message: "Work Party requires a start time."
  validates_presence_of :location, message: "Work Party requires a location."
end
