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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
