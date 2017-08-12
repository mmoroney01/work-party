class Message < ApplicationRecord
  validates :form, null: false

  belongs_to :task
  belongs_to :guest
end
