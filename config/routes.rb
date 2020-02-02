Rails.application.routes.draw do
  root "static_pages#home"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :boards

  resources :boards do 
    resources :comments, only: [:create, :destroy]
  end

  resources :boards do
    member do
      post "add", to: "favorites#create"
      delete "delete", to: "favorites#destroy"
    end
  end
end

