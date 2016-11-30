Rails.application.routes.draw do
  # get 'torder_items/create'
  # get 'torder_items/update'
  # get 'torder_items/destroy'
  # get 'carts/show'
  # get 'short_lists/create'
  # get 'short_lists/destroy'

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
  resources :recipes
  resources :comments
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

