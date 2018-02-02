class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 },
            uniqueness: true
end
