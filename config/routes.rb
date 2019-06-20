# frozen_string_literal: true

Rails.application.routes.draw do
  resources :articles

  root 'home#index'

  namespace :api do
    resources :articles
  end
end
