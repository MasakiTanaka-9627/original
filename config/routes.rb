Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
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

  resources :users do
    member do
      get "favorites"
    end
  end 

  resources :users do
    resource :relationships, only: [:create, :destroy, :show]
    member do
      get "follows"  
      get "followers"
    end
  end

end
