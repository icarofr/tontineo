Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard"

  resources :swap_request
  resources :tontines do
    member do
      get :list_users_from_company
      get :add_users_to_tontine
      get :accepte_member
      get :decline_member
    end
   resources :messages, only: :create
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
