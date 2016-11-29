Rails.application.routes.draw do
  resources :payments

  get 'short_lists/create'

  get 'short_lists/destroy'

  namespace :users do
    get 'profiles/show'
  end

  get 'instructions/new'

  get 'instructions/create'

  get 'instructions/show'

  get 'menus/index'
  get 'home/show'
  get 'carts/index'
  root 'home#index'
  get 'cook_books', to: 'cook_books#index'
  resources :cart_items
  resources :carts
  get 'user', to: 'user#show'
  resource :cook_books

  get 'checkout/show' 

  get 'orders/index'
  resources :recipes
  resources :comments
  devise_for :users, class_name: 'User',
    :controllers => {:omniauth_callbacks => 'users/omniauth_callbacks', registrations: 'users/registrations'}
  resource :orders
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

