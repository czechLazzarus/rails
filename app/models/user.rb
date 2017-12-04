class User < ApplicationRecord
  before_save { self.username = username.downcase }
  validates :firstname, presence: true, length: { maximum: 50 }
  validates :surname, presence: true, length: { maximum: 50 }
  validates :username, presence: true, length: { maximum: 255 },
            uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
end
