Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "pages#home"
  get "/rates", to: "rates#rate"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "dashboard", to: "pages#dashboard"
  resources :banks, only: [:index, :show, :update] do
    resources :rates
  end

  resources :brokers, only: [:index, :show, :new, :create, :edit, :update] do
    resources :reviews, only: [:index, :new, :create]
    resources :appointments, only: [:index, :new, :create]
  end

  resources :personals, only: [:show, :new, :create, :edit, :update]

  # resources :mortgages, only: [:show, :edit, :update]
  resources :homebuyers, only: [:show, :update]

  resources :rates do
    resources :mortgages, only: [:new, :create, :edit, :update]
  end

  resources :rates do
    resources :homebuyers, only: [:new, :create]
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
