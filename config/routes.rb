Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"

  resources :users, only: [:show] do
    resources :posts, only: [:index, :show, :new, :create], param: :author_id do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  resources :posts, only: [:index, :show], param: :id 
end
