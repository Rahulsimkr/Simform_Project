Rails.application.routes.draw do
  root 'home#index'
  resources :students
  resources :faculties
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
end
