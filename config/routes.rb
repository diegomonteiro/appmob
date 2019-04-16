Rails.application.routes.draw do
  resources :events
  resources :cities
  resources :votes

  devise_for :users
  root to: "home#index"
end
