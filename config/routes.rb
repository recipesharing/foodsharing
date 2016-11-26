Rails.application.routes.draw do
<<<<<<< HEAD
  resources :invoices
=======
>>>>>>> 8a085f8eb018791981eabf77bf854d8370b4c7fb
  get 'menus/index'
  get 'home/show'
  root 'home#index'
  get 'cook_books', to: 'cook_books#index'
<<<<<<< HEAD
  resources :cart_items
  resources :carts
=======
>>>>>>> 8a085f8eb018791981eabf77bf854d8370b4c7fb
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

