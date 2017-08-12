class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description, presence: true
      t.integer :guest_id

      t.timestamps
    end
  end
end
