Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :photos 
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  root to: 'photos#index'
end
