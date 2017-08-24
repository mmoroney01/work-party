class CreateCleanings < ActiveRecord::Migration
  def change
    create_table :cleanings do |t|
      t.datetime :start_time, presence: true
      t.string :location, presence: true
      t.integer :user_id, presence: true

      t.timestamps
    end
  end
end
