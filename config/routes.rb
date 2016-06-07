Rails.application.routes.draw do

  resources :socks, only: [:index]

  get '/:category_title', to: 'categories#show'
end
