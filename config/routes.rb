Rails.application.routes.draw do
  post 'cart/add'
  post 'cart/remove'
  post 'cart/update_quantity'
  resources :products
  root 'products#index'
end
