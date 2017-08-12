class Guest < ApplicationRecord
  validates :name, null: false
  validates :number, null: false

  has_many :tasks
end
