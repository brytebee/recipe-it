Rails.application.routes.draw do
 
  resources :foods
  devise_for :users
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
    collection do 
      get 'public', to: 'recipes#public', as: 'public'
    end
  end
 
  root "foods#index"
 
end
