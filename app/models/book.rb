class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :author }
  validates :author, presence: true
  validates :genre, presence: true
  before_destroy :abort_if_has_users_books, prepend: true

  has_many :users_books

  scope :by_title, -> (title) { where("title ILIKE ?", "%#{title}%") }
  scope :by_author, -> (author) { where("author ILIKE ?", "%#{author}%") }
  scope :by_genre, -> (genre) { where("genre ILIKE ?", "%#{genre}%") }

  def ratings_hash
    users_books.map { |users_book| { 
        :user => users_book.user,
        :rating => users_book.rating, 
        :review => users_book.review,
        :read => users_book.read 
      } 
    }
  end

  private
  def abort_if_has_users_books
    return nil if users_books.empty?
    errors.add :base, "This book has ratings and cannot be removed!"
    throw :abort
  end
end
