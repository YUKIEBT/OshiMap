Rails.application.routes.draw do
  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admin/admins/sessions'
  }

  namespace :admin do
    root 'users#index'
    resources :users, only: [:index, :show, :destroy]
  end

  devise_for :users
  root to: "homes#top"
  get 'homes/about' => 'homes#about'

  resources :posts do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
