Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'recipes#index'
  get   "/recipes",       to: "recipes#index"
  get   "/recipes/new",   to: "recipes#new"
  post  "/recipes",       to: "recipes#create"
  get   "/recipes/:id",   to: "recipes#show"
end
