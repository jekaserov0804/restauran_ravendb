Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :ingredients
  resources :sections
  resources :dishes
  resources :orders
  resources :supplement_orders
  resources :compositions

  namespace :test do
    resources :dishes, only: :index
    resources :ingredients, only: :index
    resources :sections, only: :index
    resources :orders, only: :index
    resources :supplement_orders, only: :index
    resources :compositions, only: :index
  end
end
