Rails.application.routes.draw do
  root  "pins#index"
  devise_for :users
  resources :boards, only: [:show, :create, :update]
end
