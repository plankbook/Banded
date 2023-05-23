Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users do
    resources :projects
    resources :connections, only: %i[create update]
  end
  resources :artists, only: %i[index show]
  resources :connections, only: %i[index]
end
