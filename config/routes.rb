Rails.application.routes.draw do
  get    '/dashboard',to: 'thank_cards#index'
  
  get    '/login',                         to: 'sessions#new'
  post   '/login',                         to: 'sessions#create'
  get    '/logout',                        to: 'sessions#destroy'
  get    'thank_card/like/:thank_card_id', to: 'likes#create'
  
  
  resources :password_resets, only: %i[new create edit update]
  
  resources :users, only: %i[show edit update]
  resources :card_templates, except: :index
  resources :thank_cards, only: %i[new create]
  resources :likes, only: %i[create destroy]
  
  root to: 'sessions#new'
end
