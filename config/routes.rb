Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard"

  resources :swap_request

  resources :tontines
  get "/tontines/:id/add_members", to: "tontines#add_members", as: "add_members"
  patch "/tontines/:id/add_members", to: "tontines#add_members_patch", as: "add_members_patch"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
