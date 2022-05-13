Rails.application.routes.draw do
  root to: 'sessions#new'
  
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  get    '/logout', to: 'sessions#destroy'

  get '/home', to: 'public#home'

  resources :password_resets, only: %i[new create edit update]
  
  resources :users, only: %i[index new show edit update]
end
