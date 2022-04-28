Rails.application.routes.draw do
  resources :users, except: [:index, :new, :edit]
  resources :books, except: [:new, :edit] do
    member do
      post :create_or_update_rating
    end
  end
end
