Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root  to: "pages#index"

  get "signup", to: "registrations#new"
  post "register", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  resources :users, only:[:show, :edit, :update]
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
end
