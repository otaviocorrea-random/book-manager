class Api::UserController < ApiController
  before_action :authenticate_api_user!, except: [:create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def show
    render json: user_hash
  end

  def create
    @user = User.new(create_params)
    if @user.save
      render json: user_hash, status: :created
    else
      render json: errors_hash, status: :unprocessable_entity 
    end
  end

  def update
    if @user.update(create_params)
      render json: user_hash, status: :ok
    else
      render json: errors_hash, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render json: { message: 'User deleted' }
    else
      render json: errors_hash, status: :unprocessable_entity
    end
  end

  private
  def user_hash
    { :data => { :user => @user, :books => @user.books_hash } }
  end

  def errors_hash
    { errors: @user.errors }
  end

  def create_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    begin 
      @user = current_api_user 
    rescue 
      render json: { message: 'User not found' }, status: :not_found
    end
  end
end