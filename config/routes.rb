Rails.application.routes.draw do

  get '/signup', to: 'users#new'
  resources :users, only: [:create, :edit, :update, :destroy]

  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  resources :sessions, only: :create

  resources :music_directors, only: [:index, :show] do
    resources :gigs
  end

  resources :musicians, only: [:index, :show] do
    resources :gigs, only: [:index, :show]

  end

  resources :gigs

  resources :instruments, only: [:index, :create, :show]

  resources :genres, only: [:index, :show]

end
