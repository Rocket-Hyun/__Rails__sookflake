Rails.application.routes.draw do
  root 'index#index'
  match ":controller(/:action(/:id))", via: [:get, :post]
  devise_for :users
end
