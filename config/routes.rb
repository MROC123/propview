Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get 'my_properties', to: 'properties#my_properties', as: :my_properties
  resources :pages, only: [:index]
  get 'bookmarks', to: 'bookmarks#index', as: 'user_bookmarks'

  resources :properties, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index, :new, :create, :destroy, :edit, :update]
  end

  get 'my_reviews', to: 'reviews#my_reviews', as: 'my_reviews'

  resources :pages, only: [:index]

  resources :managers, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:create, :destroy]
    resources :reviews, only: [:new, :create, :destroy, :edit, :update]
    collection do
      get :search
    end
  end

authenticate :user do
    get "profile/edit", to: "users#edit", as: :edit_profile
    patch "profile", to: "users#update", as: :profile
end

  resources :users do
    resources :properties
  end
end
