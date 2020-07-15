Rails.application.routes.draw do
  devise_for :users
  get 'todos/index'
  root "todos#index"
end
