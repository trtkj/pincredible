Rails.application.routes.draw do
  root  "pins#index"
  devise_for :users
  resources :users, only: [:show, :update] do
    resources :boards, only: [:show, :create, :update]
  end
end
