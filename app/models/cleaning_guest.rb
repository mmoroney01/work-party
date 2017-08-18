class CleaningGuest < ApplicationRecord
  belongs_to :cleaning
  belongs_to :guest

  #need validations for guest_id and cleaning_id to not be repeated
end
