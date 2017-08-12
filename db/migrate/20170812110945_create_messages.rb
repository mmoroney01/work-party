class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :form, presence: true
      t.integer :guest_id
      t.integer :task_id

      t.timestamps
    end
  end
end
