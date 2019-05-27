Rails.application.routes.draw do
  root "static_pages#home"
  get "/login", to: "sessions#new"
  post "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  get "/qa", to: "questions#index"

  resources :tags
  resources :users
  resources :account_activations, only: :edit
  resources :questions, except: :index
end
