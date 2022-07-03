Rails.application.routes.draw do
  get 'tags/create'
  get 'tags/destroy'
  get    '/dashboard',to: 'thank_cards#index'
  get    '/thank_cards',to: 'thank_cards#index'
  
  get    '/login',                         to: 'sessions#new'
  post   '/login',                         to: 'sessions#create'
  get    '/logout',                        to: 'sessions#destroy'  
  
  resources :password_resets, only: %i[new create edit update]
  
  resources :users, only: %i[index new create show edit update destroy] do
    member do
      post :show
    end
  end
  resources :card_templates
  resources :imports
  resources :exports, only: :index
  resources :tags, only: %i[create destroy]
  resources :comments, only: %i[create destroy edit update]
  resources :thank_cards, only: %i[new edit update create show destroy] do 
    collection do
      get    'approved_index'
    end
    member do
      put 'approved'
      delete 'approved_destroy'
    end
    resources :likes, only: %i[create destroy]
  end

  root to: 'sessions#new'
end
