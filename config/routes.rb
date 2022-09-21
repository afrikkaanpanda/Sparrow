Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#index"
  # get  "new-post",    to: "posts#new"
  # post "create-post", to: "posts#create"
  # get  "show-post",   to: "posts#show"
  get "signup", to: "registrations#new"
  post "register", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :posts, only:[:index, :new, :create, :show, :destroy, :edit, :update]
  resources :users, only:[:show, :edit, :update]
end
