Rails.application.routes.draw do
  resources :dashboard

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  root 'dashboard#index'
end
