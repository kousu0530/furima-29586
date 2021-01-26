Rails.application.routes.draw do
  devise_for :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/login',   to: 'registrations#new'
  post   '/login',   to: 'registrations#create'
  delete '/logout',  to: 'registrations#destroy'
  
  root to: 'items#index'
  resources :items, only: [:index, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
