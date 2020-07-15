Rails.application.routes.draw do
  devise_for :users
  root "todos#index"
  resources :users, only: [:edit, :update]
end
