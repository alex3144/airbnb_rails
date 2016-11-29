Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :bikes, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show] do
    member do
      patch :cancel
    end
  end

  resources :requests, only: [:index] do
    member do
      patch :accept
      patch :refuse
    end
  end

  namespace :owner do
    resources :bikes
  end
end
