Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :employees
  # Defines the root path route ("/")
  # root "articles#index"
  root 'employees#index'
  # get 'employees/display'
  # get 'employees/new'
  # get 'employees/show'
  get 'display', to: 'employees#display'
end

