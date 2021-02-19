Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :items do
    resources :purchase,only: [:index,:create ]
  end
end