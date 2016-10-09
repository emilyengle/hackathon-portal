Rails.application.routes.draw do

  root to: 'static_pages#index'
  get "/general_info" => "static_pages#general_info"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  resources :users do
    member do
      patch :make_admin
    end
  end

  resources :sponsors, :except => [:show]
  resources :sponsors, :only => [:show] do
    resources :pledges, :except => [:show]
    resources :tasks, :only => [:show] do
      member do
        patch :mark_complete
      end
    end
  end
  get "/users/:id/edit" => "users#edit"

  resources :tasks
end
