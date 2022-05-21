Rails.application.routes.draw do
 
  resources :foods, only: %i[new create index destroy]
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
    resources :general_shopping_list, only: [:index, :show]
    collection do 
      get 'public_recipes', to: 'recipes#public', as: 'public'
    end
  end
 
  root "foods#index"
 
end
