Rails.application.routes.draw do
  get 'register/new'
  post 'register/create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  get 'dashboard', to: 'sessions#dashboard'
  get 'authorized', to: 'sessions#page_requires_login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get 'posts/export', to: 'posts#export'
  get 'users/export', to: 'users#export'
  resources :posts
  resources :users
end
