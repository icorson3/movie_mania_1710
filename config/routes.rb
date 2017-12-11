Rails.application.routes.draw do
  # get '/movies', to: 'movies#index'

  resources :directors, shallow: true do
    resources :movies
  end

  resources :movies, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
