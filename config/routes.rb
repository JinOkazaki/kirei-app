Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts do
    get :ranking, on: :collection
    get :search, on: :collection
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  resources :users, only: :show do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
    get :likes, on: :member
  end
  resources :messages, only: :create
  resources :rooms, only: [:index, :create, :show]
end
