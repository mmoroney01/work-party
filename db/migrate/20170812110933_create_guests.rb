class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first_name, presence: true
      t.string :last_name, presence: true
      t.string :number, presence: true

      t.timestamps
    end
  end
end
