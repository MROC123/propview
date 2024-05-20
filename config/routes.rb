Rails.application.routes.draw do
  get 'users/edit'
  get 'addresses/search'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  mount ActionCable.server => '/cable'
  get 'addresses/search', to: 'addresses#search'

  get "/edit/user", to: "users#edit", as: "edit_user"
  get "up" => "rails/health#show", as: :rails_health_check
  get 'managers/search', to: 'managers#search'
  get 'my_properties', to: 'properties#my_properties', as: :my_properties
  resources :pages, only: [:index]

  resources :properties, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index, :new, :create, :destroy, :edit, :update]
  end

  resources :managers, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create, :destroy, :edit, :update]
    collection do
      get :search
    end
  end

  resources :addresses, only: [] do
    collection do
      get :search
    end
  end


  resources :users do
    resources :properties
  end
end
