Rails.application.routes.draw do
  root to: "home#show"

  # resources :users, only: [:new, :create, :edit, :update]
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  patch "/users/:id", to: "users#update", as: "user"

  # resources :socks, only: [:index, :show]
  get "/socks", to: "socks#index"
  get "/socks/:id", to: "socks#show", as: "sock"

  # resources :cart_socks, only: [:create, :destroy, :update]
  post '/cart_socks', to: "cart_socks#create"
  delete '/cart_socks/:id', to: "cart_socks#destroy"
  patch '/cart_socks/:id', to: "cart_socks#update", as: "cart_sock"

  # resources :orders, only: [:index, :show, :create]
  get "/orders", to: 'orders#index'
  get "/orders/:id", to: 'orders#show', as: "order"
  post "/orders", to: 'orders#create'

  # resources :tweets, only: [:new, :create]
  get "/tweets", to: "tweets#new", as: "new_tweet"
  post "/tweets", to: "tweets#create"

  # resources :charges, only: [:new, :create]
  get '/charges', to: "charges#new", as: "new_charge"
  post '/charges', to: "charges#create"

  get "/cart", to: "cart_socks#show"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/dashboard", to: "users#show"

  get "/auth/twitter", as: :twitter_login
  get "/auth/twitter/callback", to: "sessions#create"

  # namespace :admin do
    # get "/dashboard", to: "users#show"
  #   resources :socks
  # end

  get "/admin/dashboard", to: "admin/users#show", as: "admin_dashboard"

  get '/admin/socks', to: 'admin/socks#index'
  get '/admin/socks/new', to: 'admin/socks#new', as: "new_admin_sock"
  get '/admin/socks/:id/edit', to: 'admin/socks#edit', as: 'edit_admin_sock'
  get '/admin/socks/:id', to: 'admin/socks#show', as: "admin_sock"
  post '/admin/socks', to: 'admin/socks#create'
  patch '/admin/socks/:id', to: 'admin/socks#update'


  get "/:id", to: "navigations#show"
end
