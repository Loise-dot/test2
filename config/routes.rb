Rails.application.routes.draw do

  resources :users
  resources :comments
  resources :blogs

  # get "/blogcomments" to: "blogs#show"
  
  post "/login", to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'
  

  # get "/me", to: "users#show"
  # delete "/logout", to: "sessions#destroy"
  
  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'
  
  
  get '/blogs', to: 'blogs#index'
  post '/blogs', to: 'blogs#create'
  post '/blogs/:id', to: 'blogs#update'

  
end
