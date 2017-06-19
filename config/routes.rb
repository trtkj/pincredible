Rails.application.routes.draw do
  root  "pins#index"
  devise_for :users
  resources :users, only: [:show, :update]
  resources :boards, only: [:show, :create, :update]
  resources :pins, only: [:index, :create, :update, :show, :destroy]
end
