Rails.application.routes.draw do
  devise_for :companies
  devise_for :users
  
  resources :bars, only: [:show, :index, :edit]
  
  get 'homes/top'
  
  root to: "homes#top"
end
