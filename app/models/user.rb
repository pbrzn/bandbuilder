class User < ApplicationRecord
  has_secure_password

  validates :name, :email, :type, presence: true
  validates :name, uniqueness: true
  validates :password, presence: true, length: {minimum: 8}, on: :create

end
