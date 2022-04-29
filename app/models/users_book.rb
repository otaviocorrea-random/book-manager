class UsersBook < ApplicationRecord
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :rating, presence: false, numericality: { in: 0..10 }

  belongs_to :user
  belongs_to :book
end
