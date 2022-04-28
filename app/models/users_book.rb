class UsersBook < ApplicationRecord
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :rating, numericality: { in: 1..10 }

  belongs_to :user
  belongs_to :book
end
