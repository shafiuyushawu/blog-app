Rails.application.routes.draw do
  root to: "users#index"
  get "users/:id", to: "users#show", as: "user"
  get "users/:author_id/:posts", to: "posts#index", as: "user_posts"
end
