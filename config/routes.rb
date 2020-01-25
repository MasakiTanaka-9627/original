Rails.application.routes.draw do
  root             'static_pages#home'
  get '/help', to: 'static_pages#help'

  get '/signup',  to:'users#new'
  get '/users', to: 'users#new'

  resources :users, only: [:index, :show, :create, :edit, :update]  

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/boards', to: 'boards#new'
  post '/boards', to: 'boards#create'

  resources :boards

end

