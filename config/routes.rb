Rails.application.routes.draw do
  get 'my_products/index'
  get 'my_products/edit'
  get 'my_products/show'
  get 'my_products/new'
  get 'my_customers/index'
  get 'my_customers/edit'
  # get 'products/index'
  # get 'products/edit'
  # get 'products/show'
  # get 'products/new'
  # get 'customers/index'
  # get 'customers/edit'
  resources :myproducts
  resources :mycustomers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
