Rails.application.routes.draw do
  resources :dashboard

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  root 'dashboard#index'
end
