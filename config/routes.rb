Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]

  resources :socks, only: [:index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'

  get '/:id', to: 'navigations#show'
end
