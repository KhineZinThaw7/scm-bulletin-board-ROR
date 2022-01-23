Rails.application.routes.draw do
  # register and login
  get 'register', to: 'register#new'
  post 'register/create', to: 'register#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'

  # post and user csv export
  get 'posts/export', to: 'posts#export'
  get 'users/export', to: 'users#export'

  # post, category ad user crud
  resources :categories
  resources :posts
  resources :users

  # dashboard
  get '/dashboard', to: 'dashboard#index'

  # landing
  get '/', to: 'landing#index'
  get '/blogs', to: 'landing#blog'
  get '/category/:id/posts', to: 'landing#categoryPosts', as: 'categoryPosts'
end
