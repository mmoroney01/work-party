class Guest < ApplicationRecord
  validates :name, null: false
  validates :number, null: false

  has_many :messages
  has_many :tasks_to_do, through: :messages
end
