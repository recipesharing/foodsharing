Rails.application.routes.draw do
  get 'tcarts/show'
  get 'short_lists/create'
  get 'short_lists/destroy'
  get 'tcarts/checkout'
  

  resources :tcart, only: [:index]
  resources :torder_items, only: [:create, :update, :destroy]
  namespace :users do
    get 'profiles/show'
  end

  get 'instructions/new'

  get 'instructions/create'

  get 'instructions/show'

  get 'menus/index'
  get 'home/show'
  root 'home#index'
  get 'cook_books', to: 'cook_books#index'
  get 'user', to: 'user#show'
  resource :cook_books
  resources :recipes, only: [:show, :create, :new]
  resources :comments
  resources :tcarts
  devise_for :users, class_name: 'User',
    :controllers => {:omniauth_callbacks => 'users/omniauth_callbacks', registrations: 'users/registrations'}
  %w(
    introduce
    contact
    help
    term
    policy
  ).each do |path|
    get path, to: "static_pages##{path}"
  end
end

