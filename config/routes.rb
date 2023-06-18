Rails.application.routes.draw do
  root 'public#index'

  resources :groups do
    post 'activate', on: :member
  end
  resources :sessions, only: [:create]
  resources :dashboard, only: [:index]
end
