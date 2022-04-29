require "test_helper"

class UsersBookTest < ActiveSupport::TestCase
  test "add review" do
    user_params = {name: 'Teste', email: 'teste@email.com', password: '12345678', password_confirmation: '12345678'}
    book_params = {title: 'Teste', author: 'Teste', genre: 'batata'}
    book = Book.create(book_params)
    user = User.create(user_params)
    review = UsersBook.new(user: user, book: book)
    assert_equal(true, review.save)
    assert_equal(1, user.users_books.count)
    assert_equal(1, book.users_books.count)
  end

  test "dont create if invalid rating" do
    user_params = {name: 'Teste', email: 'teste@email.com', password: '12345678', password_confirmation: '12345678'}
    book_params = {title: 'Teste', author: 'Teste', genre: 'batata'}
    book = Book.create(book_params)
    user = User.create(user_params)
    review = UsersBook.new(user: user, book: book, rating: 11)
    assert_equal(false, review.save)
    assert_equal(0, user.users_books.count)
    assert_equal(0, book.users_books.count)
  end

  test "dont create if invalid rating string" do
    user_params = {name: 'Teste', email: 'teste@email.com', password: '12345678', password_confirmation: '12345678'}
    book_params = {title: 'Teste', author: 'Teste', genre: 'batata'}
    book = Book.create(book_params)
    user = User.create(user_params)
    review = UsersBook.new(user: user, book: book, rating: 'onze')
    assert_equal(false, review.save)
    assert_equal(0, user.users_books.count)
    assert_equal(0, book.users_books.count)
  end
end
