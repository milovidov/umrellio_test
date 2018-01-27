Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: :create
  resources :rates, only: :update
  resources :tops, only: :index
  resources :ips, only: :index
end
