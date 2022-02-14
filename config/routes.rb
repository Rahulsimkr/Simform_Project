Rails.application.routes.draw do
  # get 'homes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "homes#index"
  get 'products/default_scoped'
  get 'homes/show'
  get 'orders/search_order_by_product_name'
  # Defines the root path route ("/")
  # root "articles#index"
  # get 'application/mailer'
  resources :orders
  resources :customers
  resources :products

  # get "order/index"
  
end
