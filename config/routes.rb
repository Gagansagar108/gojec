Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users do 
    collection do 
      post "sign_up" => "users/sign_up"
    end 

    # resources :payments , only: [:create]
    # end 
  end 

  #routes  #users/:user_id/payment #create



  # Defines the root path route ("/")
  # root "posts#index"
end
