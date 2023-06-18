Rails.application.routes.draw do
  resources :groups
  root 'public#index'

  resources :sessions, only: [:create]
  resources :dashboard, only: [:index]
end
