Rails.application.routes.draw do
  get 'sponsors/index'

  get 'sponsors/show'

  get 'sponsors/new'

  get 'sponsors/create'

  get 'sponsors/edit'

  get 'sponsors/update'

  get 'sponsors/destroy'

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  resources :users
end
