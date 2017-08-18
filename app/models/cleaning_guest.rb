class CleaningGuest < ApplicationRecord
  belongs_to :cleaning
  belongs_to :guest
end
