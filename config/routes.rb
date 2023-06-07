Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users do
    resources :connections, only: :create
    resources :projects, only: %i[index new edit destroy]
  end
  resources :artists, only: %i[index show]

  resources :connections, only: %i[index show] do
    resources :messages, only: :create
  end
  patch "/connections/:id/accept", to: "connections#accept", as: :connection_accept
  patch "/connections/:id/reject", to: "connections#reject", as: :connection_reject

  resources :projects, only: :show do
    resources :posts, only: :create
    post 'add_user', on: :member
  end

  resources :posts, only: :show do
    resources :comments, only: :create
  end
end
