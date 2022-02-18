Rails.application.routes.draw do
  
  root "root_pages#index"
  get 'root_pages/index'
  
  get 'sessions/new'
  get 'sessions/create'
  get 'users/new'
  get 'events/profile'
  get "events/add_comments"
  # get 'root_pages/index'
  resources :events
  resources :enrollments
  resources :users
  resources :root_pages
  resources :sessions
  get "users/register_event"
  get 'signup', to: 'users#new'
  # post 'users' to: 'users#create'

  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'events/search'
  get "/search_event", to: "events#search"
  get "enroll_events", to: "users#register_event"
  
end
