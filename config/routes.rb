Rails.application.routes.draw do
  root             'static_pages#home'
  get '/help', to: 'static_pages#help'


  get '/signup',  to:'users#new'
  get '/users', to: 'users#new'
  post '/users', to: 'users#create'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end

