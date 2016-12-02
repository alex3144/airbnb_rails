Rails.application.routes.draw do
  root to: 'pages#home'

  mount Attachinary::Engine => "/attachinary"


  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :bikes, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show] do
    member do
      delete :cancel
    end
  end

  resources :requests, only: [:index] do
    member do
      patch :accept
      patch :refuse
    end
  end

  namespace :owner do
    resources :bikes do
      member do
        patch :available
        patch :not_available
      end
    end
  end

  resource :profile, only: [:show, :edit, :update]
  # url: "owner/bikes" -> Présentents les bikes du owner



end
