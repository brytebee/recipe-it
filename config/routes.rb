Rails.application.routes.draw do
  resources :recipe_foods
  resources :foods
  devise_for :users
  resources :recipes
  root "foods#index"
end
