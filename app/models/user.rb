class User < ApplicationRecord
  has_secure_password

  validates :name, :username, :password, presence: true
  validates_uniqueness_of :username
end
