Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    get 'companies/index'
  end
  
  devise_for :admins, controllers: {
    sessions: "admins/sessions",
    registrations: "admins/registrations"
  }

  devise_for :companies, controllers: {
    sessions: "companies/sessions",
    registrations: "companies/registrations",
    passwords: "companies/passwords"
  }

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"
  }
  get "users/show" => "users#show"
  
  namespace :admin do
    root 'homes#top'
    resources :drink_categories
    resources :comments, only: [:index, :destroy]
    resources :companies, only: [:index, :destroy]
    resources :users, only: [:index, :destroy]
  end

  namespace :companies do
    resources :posts
    resource :companies, only: [:show, :edit, :update, :destroy]
  end
  namespace :users do
    resources :posts do
        resources :comments, only: [:create, :destroy]
        resources :favorites, only: [:create, :destroy]
    end
  end
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  devise_scope :company do
    post 'companies/guest_sign_in', to: 'companies/sessions#guest_sign_in'
  end

  delete "users/posts/:post_id/favorites/:id", to: "users/favorites#destroy", as: "delete_user_post_favorite"

  root to: "homes#top"

end
