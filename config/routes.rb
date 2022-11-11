Rails.application.routes.draw do
  resources :posts
  # Defines the root path route ("/")
  root "home#index"
end
