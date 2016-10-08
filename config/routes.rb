Rails.application.routes.draw do

  resources :sponsors

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  resources :users
end
