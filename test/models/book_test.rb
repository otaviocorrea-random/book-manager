require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "create if parameters are correct" do
    book_params = {title: 'Teste', author: 'CR7', genre: 'batata'}
    book = Book.new(book_params)
    assert_equal(true, book.save)
  end

  test "dont create if author is nil or dont present" do
    book_params = {title: 'Teste', author: nil, genre: 'batata'}
    book = Book.new(book_params)
    assert_equal(false, book.save)
    book_params = {title: 'Teste', genre: 'batata'}
    book = Book.new(book_params)
    assert_equal(false, book.save)
  end

  test "dont create if genre is nil or dont present" do
    book_params = {title: 'Teste', author: 'CR7', genre: nil}
    book = Book.new(book_params)
    assert_equal(false, book.save)
    book_params = {title: 'Teste', author: 'CR7'}
    book = Book.new(book_params)
    assert_equal(false, book.save)
  end
  
  test "add review" do
    user_params = {name: 'Teste', email: 'teste@email.com', password: '12345678', password_confirmation: '12345678'}
    book = Book.create(title: 'Teste', author: 'Teste', genre: 'batata')
    user = User.create(user_params)
    review = UsersBook.new(user: user, book: book)
    assert_equal(true, review.save)
    assert_equal(1, book.users_books.count)
  end
end