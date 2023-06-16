Rails.application.routes.draw do
  root to: "users#index"
  resources :users, only: [:show] do
    resources :posts, only: [:index, :show, :new, :create], param: :author_id
  end
  resources :posts, only: [:index, :show], param: :post_id
end
