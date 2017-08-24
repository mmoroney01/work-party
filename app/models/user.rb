require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  has_many :cleanings

  validates :username, null: false, uniqueness: true
  validates :email, null: false, uniqueness: true
  validates :password_hash, null: false

  validates_presence_of :username, :email, :password_hash

  validates_uniqueness_of :username, :email

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = self.find_by(email: email)
    if user && user.password == password
      return user
    else
      return nil
    end
  end
end
