class Task < ApplicationRecord
  validates :description, null: false

  belongs_to :guest
end
