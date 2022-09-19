Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#index"
  # get  "new-post",    to: "posts#new"
  # post "create-post", to: "posts#create"
  # get  "show-post",   to: "posts#show"
  get "signup", to: "registrations#new"
  post "register", to: "registrations#create"

  resources :posts, only:[:index, :new, :create, :show, :destroy, :edit, :update]
<<<<<<< HEAD
  resources :users, only:[:show, :edit, :update]
=======
  resources :users, only:[:new, :create, :show, :edit, :update]
>>>>>>> 5a69e602c00c367dce577e5f039fa1ea3d597eff
end
