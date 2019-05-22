Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/qa", to: "questions#index"
  root "static_pages#home"  
  get "/login", to:"sessions#new"
end
