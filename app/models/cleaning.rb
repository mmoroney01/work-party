class Cleaning < ActiveRecord::Base
  has_many :guests, through: :cleaning_guests
  #has_many :tasks, how to get to tasks table?
end
