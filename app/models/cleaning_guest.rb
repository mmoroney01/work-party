class CleaningGuest < ApplicationRecord
  belongs_to :cleaning
  belongs_to :guest

  validates_uniqueness_of :guest_id, scope: :cleaning_id
  #need validations for guest_id and cleaning_id to not be repeated
end
