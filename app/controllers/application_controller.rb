class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def set_book
    begin 
      @book = Book.find(params[:book_id] || params[:id]) 
    rescue 
      render json: { message: 'Book not found' }, status: :not_found
    end
  end

  def set_user
    begin 
      @user = User.find(params[:user_id] || params[:id]) 
    rescue 
      render json: { message: 'User not found' }, status: :not_found
    end
  end
end
