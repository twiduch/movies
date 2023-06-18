Rails.application.routes.draw do
  root 'public#index'

  resources :sessions, only: [:create]
end
