Rails.application.routes.draw do
  resources :events
  resources :cities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  devise_for :users

  get "cities_by_names", to: "cities#city_by_names"
end
