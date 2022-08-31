Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#index"
  # get  "new-post",    to: "posts#new"
  # post "create-post", to: "posts#create"
  # get  "show-post",   to: "posts#show"
  resources :posts, only:[:index, :new, :create, :show, :destroy]
end
