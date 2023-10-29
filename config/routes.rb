Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  # Favorites routes
  post '/favorites', to: 'favorites#create', as: 'favorites'
  delete '/favorites/:id', to: 'favorites#destroy', as: 'destroy_favorite'


  # Custom routes for places
  get 'museus', to: 'places#museus'
  get 'aldeias', to: 'places#aldeias'
  get 'trilhos', to: 'places#trilhos'
  get 'lagoas', to: 'places#lagoas'

  # Resourceful routes for places
  resources :places
  resources :places do
    resources :comments, only: [:create, :new]
  end

  resources :users, only: [:show]
  # Define your other routes here
end
