Rails.application.routes.draw do
  devise_for :users
  root to: 'prospects#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :prospects, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :conversations, only: [:index, :new, :create]
  end
end
