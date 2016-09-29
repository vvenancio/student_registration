Rails.application.routes.draw do
  root to: 'dashboards#index'

  resources :students
  resources :courses
  resources :dashboards, only: :index
end
