Rails.application.routes.draw do
  # get '/movies', to: 'movies#index'

  root "welcome#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  resources :directors, shallow: true do
    resources :movies
  end

  resources :movies, only: [:index]
  resources :users, only: [:show, :new, :create]

  namespace :admin do
    resources :categories, only: [:index]
    resources :genres, only: [:index, :create,:show]

  end
  
    resources :genres, only: [:index,:show]
  #
  #
  # get 'genres', to: "genres#index" ,as: "genres"
  # get 'genre', to: "genres#show" ,as: "genre"

  resources :carts, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
