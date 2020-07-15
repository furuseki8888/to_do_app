Rails.application.routes.draw do
  get 'todos/index'
  root "todos#index"
end
