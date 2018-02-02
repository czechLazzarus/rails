class User < ApplicationRecord
  before_save { self.username = username.downcase }
  validates :firstname, presence: true, length: { maximum: 50 }
  validates :surname, presence: true, length: { maximum: 50 }
  validates :username, presence: true, length: { maximum: 255 },
            uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, :on => [:create, :new]
  has_secure_password


  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
