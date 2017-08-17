class Cleaning < ActiveRecord::Base
  has_many :cleaning_guests
  has_many :guests, through: :cleaning_guests
  has_many :tasks, through: :guests
end
