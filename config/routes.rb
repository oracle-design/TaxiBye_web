Rails.application.routes.draw do
  devise_for :users
  root 'prototype#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :taxis, param: :license_plate_number, only: [] do
        collection do
          get 'ranking'
        end
        member do
          post 'query'
        end
        resources :trips, only: [:create]
      end
    end
  end
end
