Rails.application.routes.draw do
  resources :events
  resources :cities
  resources :votes
  resources :event_responses
  devise_for :users
  root to: "home#index"
end
