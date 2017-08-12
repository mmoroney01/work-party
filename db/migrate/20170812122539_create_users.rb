class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, presence: true, limit: 20
      t.string :email, presence: true, limit: 25
      t.string :password_hash, presence: true, limit: 20

      t.timestamps
    end
  end
end
