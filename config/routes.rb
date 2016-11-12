Rails.application.routes.draw do
  root 'home#index'
  resources :recipes
  devise_for :users, class_name: 'User',
    :controllers => {:omniauth_callbacks => 'users/omniauth_callbacks', registrations: 'users/registrations'}
end
