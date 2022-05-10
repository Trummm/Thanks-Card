Rails.application.routes.draw do
  root to: 'sessions#new'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
<<<<<<< HEAD
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: %i[index new show edit]
=======
  get '/logout', to: 'sessions#destroy'
>>>>>>> c89b289fdc649c3c1d5422d7fb4a68709d95979b
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
