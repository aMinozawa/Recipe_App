Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'recipes#home'
  get    "/users/:id",       to: "users#show"
  resources :recipes do
    resources :comments, only: [:create, :destroy]
  end
end
