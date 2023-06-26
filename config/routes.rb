Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
    resources :users, only: [:index, :show, :create, :update, :destroy] do
      resources :rooms, only: [:index, :show, :create, :destroy]
      resources :reservations, only: [:index, :create, :destroy]
    end
    post '/users/login', to: 'users#login'
    post '/users/logout', to: 'users#logout'
  end