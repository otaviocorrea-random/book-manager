class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  has_many :users_books, dependent: :delete_all

  def books_hash
    users_books.map { |users_book| { 
        :book => users_book.book,
        :rating => users_book.rating, 
        :review => users_book.review,
        :read => users_book.read 
      } 
    }
  end
end
