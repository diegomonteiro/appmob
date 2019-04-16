Rails.application.routes.draw do
  resources :events
  resources :cities

  devise_for :users
  root to: "home#index"
end
