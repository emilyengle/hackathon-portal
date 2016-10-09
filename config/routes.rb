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
    resources :tasks, :only => [:show] do
      member do
        patch :mark_complete
      end
    end
    resources :perks, :only => [:index] do
      collection do
        post :add_to_sponsor
      end
      member do
        delete :remove_from_sponsor
      end
    end
  end

  resources :perks, :except => [:show]

  resources :tasks
end
