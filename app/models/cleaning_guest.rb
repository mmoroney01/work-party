class CleaningGuest < ActiveRecord::Base
  belongs_to :cleaning
  belongs_to :guest
end
