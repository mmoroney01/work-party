class CreateCleaningGuests < ActiveRecord::Migration
  def change
    create_table :cleaning_guests do |t|
      t.integer :cleaning_id
      t.integer :guest_id

      t.timestamps
    end
  end
end
