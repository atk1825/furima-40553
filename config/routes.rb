Rails.application.routes.draw do
  get 'categories/new'
  devise_for :users
root "items#index"
resources :items do
  collection do
    get 'search'
    get 'find'
  end
  resources :purchase_records
end
  get '/category/:id', to: 'categories#search'
end
