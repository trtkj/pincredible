Rails.application.routes.draw do
  root  "pins#index"
  devise_for :users
end
