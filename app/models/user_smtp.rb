class UserSmtp < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :username,  presence: true, length: { maximum: 100 }
  validates :port, numericality: { only_integer: true }
  validates :protocol,  presence: true, length: { maximum: 100 }
  validates :smtp,  presence: true, length: { maximum: 100 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: false, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
end
