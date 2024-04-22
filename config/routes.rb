Rails.application.routes.draw do
  
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
  
  namespace :admins do
   resources :drink_categories
  end

  
  namespace :companies do
    resources :posts
  end

  

  get 'homes/top'

  root to: "homes#top"

end
