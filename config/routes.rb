Rails.application.routes.draw do

  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admin/admins/sessions'
  }

  namespace :admin do
    root 'users#index'
    resources :posts, only: [:index, :destroy]
    resources :users, only: [:index, :show, :destroy]
  end

  scope module: :public do
    devise_for :users
    root to: "homes#top"
    get 'homes/about' => 'homes#about'
    get 'search',  to: 'searches#search'

    resources :posts do
      resource :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end

    resources :users, only: [:index, :show, :edit, :update]
  end
end
