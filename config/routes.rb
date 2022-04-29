Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'

    # User Routes
    get 'user', action: :show, controller: 'user'
    post 'user', action: :create, controller: 'user'
    put 'user', action: :update, controller: 'user'
    delete 'user', action: :destroy, controller: 'user'
    # End user routes
    
    resources :books, except: [:new, :edit] do
      member do
        post :create_or_update_rating
      end
    end
  end
end
