class Guest < ApplicationRecord
  validates :first_name, null: false
  validates :last_name, null: false
  validates :number, null: false

  has_many :tasks
  has_many :cleanings, through: :cleaning_guests
end
