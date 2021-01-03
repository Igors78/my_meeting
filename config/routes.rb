# frozen_string_literal: true

Rails.application.routes.draw do
  root 'meetings#index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'

  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :meetings do
    member do
      get '/invite_user', to: 'meetings#invite_user'
    end
  end
end
