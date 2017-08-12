class Guest < ApplicationRecord
  has_many :messages
  has_many :tasks_to_do, through: :messages
end
