Rails.application.routes.draw do

  resources :socks, only: [:index]

  get '/:id', to: 'navigations#show'
end
