class Task < ApplicationRecord
  has_many :messages
  has_many :guests_to_do_task, through: :messages
end
