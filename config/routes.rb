Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/destroy'
  get 'products/index'
  get 'products/show'
  get 'products/new'
  get 'products/create'
  get 'products/edit'
  get 'products/update'
  get 'products/destroy'
  get 'stores/index'
  get 'stores/new'
  get 'stores/create'
  get 'stores/destroy'
  get 'stores/show'
  devise_for :users
  root to: "pages#home"

  resources :stores, only: %i[index new create destroy edit update]

  resources :stores, only: %i[show] do
    resources :products
    resources :review, only: %i[index new create destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
