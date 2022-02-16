Rails.application.routes.draw do
  resources :events
  resources :users
  root "events#index"
end
