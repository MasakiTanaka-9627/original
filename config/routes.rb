Rails.application.routes.draw do
  root "static_pages#home"
  get "/signup", to: "users#new"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  
  
  resources :users, only: [:index, :show, :create, :edit, :update]
  resources :boards do
    collection do
      get 'search' => 'articles#search'
    end
  end

  resources :comments, only: [:create, :destroy]
end
