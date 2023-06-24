Rails.application.routes.draw do
  devise_for :users
  # root to: "users#index"

  devise_for :users, skip: :all
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :show, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  post "users/:user_id/posts", to: "posts#create", as: :user_create_post
end
