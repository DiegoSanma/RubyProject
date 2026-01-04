Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post '/api/signup', to: 'auth#signup'
  post '/api/login',  to: 'auth#login'
  get '/api/users', to: 'user#index'
  get '/api/me', to: 'user#me'
  post '/api/friend_request', to: 'friend_requests#create'
  get '/api/friend_requests', to: 'friend_requests#index'
  put '/api/friend_request/:id', to: 'friend_requests#update'
  get '/api/friends', to: 'friends#index'
  get '/api/user_relationship/:id', to: 'user#user_relationship'
  resources :friend_requests, only: [:create, :index, :update]
end
