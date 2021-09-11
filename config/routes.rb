Rails.application.routes.draw do

  get '/', to: 'users#index', as: 'root'

  get '/signup', to: 'users#new'
  resources :users, only: [:create, :destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  get '/auth/google_oauth2/callback', to: 'sessions#create'

  resources :music_directors, only: [:index, :show, :edit, :update] do
    resources :gigs
  end

  resources :musicians, only: [:index, :show, :edit, :update] do
    resources :gigs, only: [:index, :show]

  end

  resources :gigs

  resources :instruments, only: [:index, :create, :show]

  resources :genres, only: [:index, :show]

end
