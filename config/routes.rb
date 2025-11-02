Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  devise_for :admins
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
