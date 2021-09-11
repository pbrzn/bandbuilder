class User < ApplicationRecord
  has_secure_password

  validates :name, :email, :type, :password, presence: true, on: :create
  validates :name, uniqueness: true
  validates :password, length: {minimum: 8}, on: :create

end
