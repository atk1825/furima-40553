Rails.application.routes.draw do
  get 'categories/new'
  devise_for :users
root "items#index"
resources :items do
  collection do
    get 'search'
  end
  resources :purchase_records
end
  resources :categories, only: :index 
  get '/category/:id', to: 'categories#search'
end
