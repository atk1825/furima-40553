Rails.application.routes.draw do
  get 'categories/new'
  devise_for :users
root "items#index"
resources :items do
  resources :comments, only: :create
  resource :likes, only: [:create, :destroy]
  collection do
    get 'search'
    get 'find'
  end
  resources :purchase_records
end
  get '/category/:id', to: 'categories#search'
end
