class Category < ApplicationRecord
  has_and_belongs_to_many :contacts
  validates :name, presence: true, length: { maximum: 255 },
            uniqueness: true
end
