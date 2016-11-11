Rails.application.routes.draw do
  root 'home#index'
  resource :recipes
  devise_for :users, class_name: 'User',
    :controllers => {:omniauth_callbacks => 'users/omniauth_callbacks', registrations: 'users/registrations'}
  resource :recipes
end
