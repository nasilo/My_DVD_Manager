Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "sessions#new"

  get "auth/:provider/callback", to: "sessions#create"
  get "signin", to: "sessions#new", as: "signin"

  post "/upcs" => "dvds#upc", as: "upcs"

  resources :auth, only: :show
  resources :sessions, only: [:destroy, :new]
  resources :users do
    resources :dvds
  end

  namespace :api do
    namespace :v1 do
      resources :dvds
      post "/upcs" => "dvds#upc", as: "upcs"
    end
  end
end
