Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
  end
  
  # Defines the root path route ("/")
  root "home#index"
end
