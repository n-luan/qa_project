Rails.application.routes.draw do
  root "static_pages#home"
  get "/login", to: "sessions#new"
  post "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  get "/qa", to: "questions#index"
  resources :profiles, only: [:edit, :update]
  resources :tags
  resources :users
  resources :questions, except: :index
  resources :password_resets, only: [:new, :edit, :create, :update]
  resources :account_activations, only: :edit
  resources :questions do
    resources :answers, except: [:index, :show, :edit, :update]
  end
end
