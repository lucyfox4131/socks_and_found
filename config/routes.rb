Rails.application.routes.draw do

  resources :socks, only: [:index]

  get '/:navigation_title', to: 'navigations#show'
end
