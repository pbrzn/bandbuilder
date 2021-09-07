class User < ApplicationRecord
  has_secure_password

  validates :name, :email, :password, :type, presence: true
  validates :name, uniqueness: true
  validates :password, length: {minimum: 8}
end
