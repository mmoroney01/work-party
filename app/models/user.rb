require 'bcrypt'

class User < ApplicationRecord
  include BCrypt
  validates :username, null: false, uniqueness: true
  validates :email, null: false, uniqueness: true
  validates :password_hash, null: false

  validates_presence_of :username, message: "Username cannot be left blank."
  validates_presence_of :username, message: "Email cannot be left blank."
  validates_presence_of :password_hash, message: "Password cannot be left blank."

  validates_uniqueness_of :username, message: "Username must be unique."

  validates_uniqueness_of :email, message: "Email must be unique."



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
