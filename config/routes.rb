Rails.application.routes.draw do
  resources :recipes
  root "recipe#index"
end
