Rails.application.routes.draw do
  get 'order/edit'
  get 'order/new'
  get 'order/index'
  get 'order/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   resources :application
  # Defines the root path route ("/")
  # root "articles#index"
  # get 'application/mailer'
end
