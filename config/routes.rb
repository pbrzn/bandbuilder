Rails.application.routes.draw do

  get '/', to: 'users#index', as: 'root'

  get '/signup', to: 'users#new'
  resources :users, only: [:create, :edit, :update, :destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

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
