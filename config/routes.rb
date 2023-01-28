Rails.application.routes.draw do
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :coins, except: [:show] do
    collection do
      get :refresh
    end
  end
  # Defines the root path route ("/")
  root "coins#index"


end
