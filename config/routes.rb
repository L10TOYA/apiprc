Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  #GET /api/v1/balance
  #POST /api/v1/deposit
  #POST /api/v1/withdraw

  namespace :api do
    namespace :v1 do
      #resource :balance, only: [:show], controller: :balance
      get 'balance', to: 'balance#show'
      post 'deposit', to: 'deposit#create'
      post 'withdraw', to: 'withdraw#create'

    end
  end


end
