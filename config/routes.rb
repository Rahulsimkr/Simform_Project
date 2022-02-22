Rails.application.routes.draw do
  # get 'employees/index'
  # get 'employees/show'
  # get 'employees/edit'
  # get 'employees/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "employees#index"
  get 'employees/search'
  get "/search_employee", to: "employees#search"
  resources :employees
  
  # get 'employees/search'
  # get 'index' => 'employees#index'

  # Defines the root path route ("/")
  # root "articles#index"
end
