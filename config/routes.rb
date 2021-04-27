Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :photos do
    resources :likes, only: [:create, :destroy]
  end
  root to: 'photos#index'
end
