require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "create if parameters are correct" do
    user_params = {name: 'Teste', email: 'teste@email.com', password: '12345678', password_confirmation: '12345678'}
    user = User.new(user_params)
    assert_equal(true, user.save)
  end

  test "dont create if passwords are diff" do
    user_params = {name: 'Teste', email: 'teste@email.com', password: '12345678', password_confirmation: '123456789'}
    user = User.new(user_params)
    assert_equal(false, user.save)
  end

  test "dont create if email exists" do
    user_params = {name: 'Teste', email: 'teste@email.com', password: '12345678', password_confirmation: '12345678'}
    assert_equal(true, User.create(user_params).save)
    assert_equal(false, User.create(user_params.merge({name: 'Teste Jr.'})).save)
  end

  test "dont create if email is invalid" do
    user_params = {name: 'Teste', email: 'batata', password: '12345678', password_confirmation: '12345678'}
    assert_equal(false, User.create(user_params).save)
  end
  
  test "add review" do
    user_params = {name: 'Teste', email: 'teste@email.com', password: '12345678', password_confirmation: '12345678'}
    book = Book.create(title: 'Teste', author: 'Teste', genre: 'batata')
    user = User.create(user_params)
    review = UsersBook.new(user: user, book: book)
    assert_equal(true, review.save)
    assert_equal(1, user.users_books.count)
  end
end