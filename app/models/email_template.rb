class EmailTemplate < ApplicationRecord
  validates :subject, presence: true, length: { maximum: 100 }
  validates :sender, presence: true, length: { maximum: 100 }
  validates :text, presence: true
end
