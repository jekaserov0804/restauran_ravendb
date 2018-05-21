Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :ingredients
  resources :sections
  resources :dishes
  resources :orders
  resources :supplement_orders
  resources :compositions

  namespace :test do
    resource :dishes, only: :index
    resource :ingredients, only: :index
    resource :sections, only: :index
    resource :orders, only: :index
    resource :supplement_orders, only: :index
    resource :compositions, only: :index
  end
end
