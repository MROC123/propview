Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
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

  resources :users do
    resources :properties
  end
end
