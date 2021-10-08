Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts do
    resources :comments, only: [:create,:destroy]
    resource :likes, only: [:create,:destroy]
  end
  resources :users, only: :show do
    resource :relationships, only: [:create,:destroy]
    get :followings, on: :member
    get :follower, on: :member
  end
end
