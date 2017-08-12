class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, presence: true
      t.string :email, presence: true
      t.string :password_hash, presence: true

      t.timestamps
    end
  end
end
