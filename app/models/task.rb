class Task < ApplicationRecord
  validates :description, null: false
  validates :guest_id, null: false

  belongs_to :guest
end
