  Rails.application.routes.draw do
  get 'user/new'
  get 'user/create'
  get 'user/update'
  get 'user/edit'
  get 'user/destroy'
  get 'user/index'
  get 'user/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
