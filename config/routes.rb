Rails.application.routes.draw do
  devise_for :users
  root  "pins#index"
end
