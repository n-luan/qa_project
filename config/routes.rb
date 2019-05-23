Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/login", to: "sessions#new"
  post "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/qa", to: "questions#index"
  root "static_pages#home"  
  get "/signup", to: "users#new"
  resources :users
  resources :account_activations, only: :edit 
end
