Rails.application.routes.draw do

  resources :sponsors

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  resources :users

  resources :sponsors, :except => [:show]

  resources :sponsors, :only => [:show] do
    resources :pledges, :except => [:show]
  end

  resources :tasks
end
