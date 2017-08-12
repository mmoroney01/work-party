class Message < ApplicationRecord
  belongs_to :task
  belongs_to :guest
end
