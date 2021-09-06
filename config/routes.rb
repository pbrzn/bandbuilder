Rails.application.routes.draw do

  get '/signup', to: 'users#new'
  resources :users, only: [:create, :edit, :update, :destroy]

  get '/login', to: 'sessions#new'
  resources :sessions, only: [:create, :destroy]

  resources :music_directors, only: [:index, :show] do
    resources :gigs
  end

  resources :musicians, only: [:index, :show]

  resources :gigs, only: [:index, :show]

  resources :instruments, only: [:index, :new, :create, :show]

  resources :genres, only: [:index, :new, :create, :show]

end
