Rails.application.routes.draw do
  root to: 'sessions#new'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  get    '/logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

  resources :password_resets, only: %i[new create edit update]
  
  resources :users, only: %i[index new show edit]

  get '/logout', to: 'sessions#destroy'
end
