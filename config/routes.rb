Rails.application.routes.draw do
  get 'tasks/index'

  get 'tasks/show'

  get 'tasks/new'

  get 'tasks/create'

  get 'tasks/edit'

  get 'tasks/update'

  get 'tasks/destroy'

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
