Rails.application.routes.draw do

  devise_for :users
  root to: "pages#index"
  get "dashboard", to: "pages#dashboard"
  get "mystores", to: "stores#mystores"
  resources :stores, only: %i[index new create destroy edit update]

  resources :stores, only: %i[show] do
    resources :products
    resources :reviews, only: %i[index new create destroy show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
