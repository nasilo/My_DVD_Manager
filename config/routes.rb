Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "auth/:provider/callback", to: "sessions#create"
  get "signin", to: "sessions#new", as: "signin"

  root "sessions#new"

  resources :auth, only: :show
  resources :sessions, only: [:destroy, :new]
  resources :users
  resources :dvds
end
