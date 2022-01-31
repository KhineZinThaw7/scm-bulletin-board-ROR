Rails.application.routes.draw do
  # register and login
  get 'register', to: 'register#new'
  post 'register/create', to: 'register#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'

  get 'forget-password', to: 'forget_password#forgetPassword'
  post 'forget-password', to: 'forget_password#forgetPasswordEmail'
  get 'reset-password', to: 'forget_password#new'
  post 'reset-password', to: 'forget_password#resetPassword'

  # post and user csv export/import
  get 'posts/export', to: 'posts#export'
  get 'users/export', to: 'users#export'
  post 'posts/import', to: 'posts#import'
  post 'users/import', to: 'users#import'

  # user profile
  get 'profile', to: 'users#profile',  as: 'profile'

  # post, category and user crud
  resources :categories
  resources :posts
  resources :users

  # dashboard
  get '/dashboard', to: 'dashboard#index'
  get '/dashboard/user-chart', to: 'dashboard#userChart',  as: 'userChart'
  get '/dashboard/post-chart', to: 'dashboard#postChart',  as: 'postChart'

  # landing
  get '/', to: 'landing#index'
  get '/blogs', to: 'landing#blog'
  get '/category/:id/posts', to: 'landing#categoryPosts', as: 'categoryPosts'
  get '/post/:id', to: 'landing#postDetail', as: 'postDetail'
end
