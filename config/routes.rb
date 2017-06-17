Rails.application.routes.draw do
  devise_for :installs
  root  "pins#index"
end
