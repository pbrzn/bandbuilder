Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login', to: 'sessions#new'
  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:new, :create]
  resources :music_directors, only: [:index, :show, :edit, :update, :destroy]
  resources :musicians, only: [:index, :show, :edit, :update, :destroy]
  resources :gigs
  resources :instruments, only: [:index, :new, :create, :show]
  resources :genres, only: [:index, :new, :create, :show]
end
