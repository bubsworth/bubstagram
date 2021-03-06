Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "sessions", registrations: "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  
  resources :posts do
    resources :comments
    resources :likes
  end
  
  resources :users do
    resources :collects
  end

  resources :notifications
end
