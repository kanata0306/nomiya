Rails.application.routes.draw do

  #get 'companies/show'
  #get 'users/show'
  devise_for :admins, controllers: {
    sessions: "admins/sessions",
    registrations: "admins/registrations"
  }

  devise_for :companies, controllers: {
    sessions: "companies/sessions",
    registrations: "companies/registrations"
  }

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  get "users/show" => "users#show"
  namespace :admins do
   resources :drink_categories
  end


  namespace :companies do
    resources :posts
    resource :companies, only: [:show, :edit, :update, :destroy]
  end
  namespace :users do
    resources :posts do
        resources :comments
    end
  end

  #get 'homes/top'

  root to: "homes#top"

end
