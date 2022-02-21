Rails.application.routes.draw do
  root "homes#index"
  get 'products/default_scoped'
  get 'homes/show'
  get 'orders/search_order_by_product_name'
  resources :orders
  resources :customers
  resources :products
end
