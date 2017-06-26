Rails.application.routes.draw do
  root  "pins#index"
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :boards, only: [:show, :create, :update]
  resources :pins, only: [:index, :create, :update, :show, :destroy]
  resources :board_pins, only: [:create, :destroy]
end
