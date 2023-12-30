Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  get 'homes/about' => 'homes#about', as:'about'

resources :users, only: [:show, :edit, :index, :update]
resources :books, only: [:show, :edit, :index, :update, :new, :create, :destroy]

end
