Rails.application.routes.draw do
  devise_for :users
root "items#index"
resources :items do
  collection do
    get 'search'
  end
  resources :purchase_records
end
end
