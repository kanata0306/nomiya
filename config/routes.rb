Rails.application.routes.draw do
  
  # Rails generator for Devise controllers for companies
  devise_for :companies, controllers: {
    sessions: "companies/sessions",
    registrations: "companies/registrations"
  }
  
  devise_for :users
  
  namespace :companies do
    resources :posts
  end

  resources :bars, only: [:show, :index, :edit]

  get 'homes/top'

  root to: "homes#top"
end
