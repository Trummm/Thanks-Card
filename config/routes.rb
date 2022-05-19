Rails.application.routes.draw do
  get    '/dashboard',to: 'users#index'
  
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  get    '/logout',   to: 'sessions#destroy'
  
  
  resources :password_resets, only: %i[new create edit update]
  
  resources :users, only: %i[show edit update]
  resources :card_templates, only: %i[new create]
  resources :thank_cards, only: %i[new create]
  
  root to: 'sessions#new'
end
