Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login', to: 'sessions#new'
  resources :sessions, only: [:create, :destroy]

  resources :users, only: [:new, :create, :edit, :update, :destroy]

  resources :music_directors, only: [:index, :show] do
    resources :gigs
  end

  resources :musicians, only: [:index, :show]

  resources :gigs, only: [:index, :show]

  resources :instruments, only: [:index, :new, :create, :show]

  resources :genres, only: [:index, :new, :create, :show]
end
