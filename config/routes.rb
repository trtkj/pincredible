Rails.application.routes.draw do
  root  "pins#index"
  devise_for :users
  resources :boards, only: [:index, :create, :update]
end
