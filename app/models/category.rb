# Category model
class Category < ApplicationRecord
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :email_templates
  validates :name, presence: true, length: { maximum: 255 },
                   uniqueness: true
end
