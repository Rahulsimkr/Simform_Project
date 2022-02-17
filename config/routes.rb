Rails.application.routes.draw do
  get 'sessions/new'
  # get 'root_pages/index'
  resources :events
  resources :users
  resources :root_pages
  resources :sessions
  get 'signup', to: 'users#new'
  root "events#index"
end
