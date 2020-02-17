Rails.application.routes.draw do
  resource :user_mfa_session, only: [:new, :create]

  get "relationships/create"
  get "relationships/destroy"
  root "static_pages#home"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :boards

  resources :boards do
    resources :comments, only: [:create, :destroy]
  end

  resources :comments do
    member do
      post "add", to: "favorite_comments#create"
      delete "delete", to: "favorite_comments#destroy"
    end
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
    resource :relationships, only: [:create, :destroy, :show, :index]
    member do
      get "follows"
      get "followers"
    end
  end
end
