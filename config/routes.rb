Rails.application.routes.draw do
  devise_for :users
  resources :courses
  resources :users, only: %i[index edit update show]
  get 'home/activity'
  root 'home#index'
end
