Rails.application.routes.draw do

  root to: 'static_pages#index'

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  resources :users

  resources :sponsors, :except => [:show]
  resources :sponsors, :only => [:show] do
    resources :pledges, :except => [:show]
  end

  resources :tasks
end
