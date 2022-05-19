Rails.application.routes.draw do
  resources :foods
  devise_for :users
  resources :recipes
  root "foods#index"
end
