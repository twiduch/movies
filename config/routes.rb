Rails.application.routes.draw do
  root 'public#index'

  resources :groups do
    post 'activate', on: :member
  end
  resources :sessions, only: [:create]
  resources :dashboard, only: [:index]

  post '/add_movie/:imdb_id', to: 'movies#add_movie', as: 'add_movie'
  post '/remove_movie/:imdb_id', to: 'movies#remove_movie', as: 'remove_movie'
end
