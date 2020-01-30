Rails.application.routes.draw do
  root "static_pages#home"

  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :boards

  resources :boards do 
    resources :comments, only: [:create, :destroy]
  end
end
