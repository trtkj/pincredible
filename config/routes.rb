Rails.application.routes.draw do
  root  "pins#index"
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :boards, only: [:index, :show, :create, :update, :destroy]
  resources :pins, only: [:index, :create, :update, :show, :destroy]
  resources :board_pins, only: [:create, :destroy]
  resources :tags, only: [:index, :show, :create]
end
