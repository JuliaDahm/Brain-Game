Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  resources :users
  resources :questions
  resources :dashboard

  get '/scores', :to => 'dashboard#scores'
  get '/answer', :to => 'questions#check_answer'
  # get '/create_question', :to => 'questions'
  root 'dashboard#index'

end
