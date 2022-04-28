class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :create_or_update_rating]
  before_action :set_user, only: [:create_or_update_rating]

  def index
    @books = Book.all
    apply_filters
    render json: { :data => { :books => @books } }
  end

  def show
    render json: book_hash
  end

  def create
    @book = Book.new(create_params)
    if @book.save
      render json: book_hash, status: :created, location: @book 
    else
      render json: errors_hash, status: :unprocessable_entity 
    end
  end

  def update
    if @book.update(create_params)
      render json: book_hash, status: :ok, location: @book 
    else
      render json: errors_hash, status: :unprocessable_entity
    end
  end

  def destroy
    if @book.destroy
      render json: { message: 'Book deleted' }
    else
      render json: errors_hash, status: :unprocessable_entity
    end
  end

  # Ratings
  def create_or_update_rating
    @user_book = UsersBook.find_or_create_by(user_id: @user.id, book_id: @book.id)
    if @user_book.update(rating_params)
      render json: { :data => { :rating => @user_book } }
    else
      render json:  { errors: @user_book.errors }, status: :unprocessable_entity
    end
  end

  private
  def book_hash
    { :data => { :book => @book, :ratings => @book.ratings_hash } }
  end

  def errors_hash
    { errors: @book.errors }
  end

  def create_params
    params.permit(:title, :author, :genre)
  end

  def rating_params
    params.permit(:user_id, :review, :rating, :read)
  end

  def filter_params
    params.permit(:title, :author, :genre)
  end

  def apply_filters
    @books = @books.by_title(filter_params[:title]) if filter_params[:title].present?
    @books = @books.by_author(filter_params[:author]) if filter_params[:author].present?
    @books = @books.by_genre(filter_params[:genre]) if filter_params[:genre].present?
  end
end