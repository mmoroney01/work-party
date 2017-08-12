class Guest < ApplicationRecord
  validates :first_name, null: false
  validates :last_name, null: false
  validates :number, null: false

  has_many :tasks
end
