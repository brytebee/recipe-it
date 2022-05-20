Rails.application.routes.draw do
 
  resources :foods
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
    resources :shopping_list, only: [:index, :show]
    collection do 
      get 'public', to: 'recipes#public', as: 'public'
    end
  end
 
  root "foods#index"
 
end
