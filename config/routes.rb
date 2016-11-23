Rails.application.routes.draw do
  get 'menus/index'
  get 'home/show'
  root 'home#index'
  get 'cook_books', to: 'cook_books#index'
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

