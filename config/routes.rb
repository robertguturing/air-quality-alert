Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "main#index"

  resources :users, only: [:show, :update]
end
