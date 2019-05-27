Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  get "/login", to: "sessions#new"
  post "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  get "/qa", to: "questions#index"
  resources :users
  resources :questions, except: :index
  resources :password_resets, only: [:new, :edit, :create, :update]
  resources :account_activations, only: :edit
  resources :questions, except: :index do
    resources :answers, except: [:index, :show, :edit, :update]
  end
end
