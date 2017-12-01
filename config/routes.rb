Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :update, :edit] do
  end

  resources :events, only: [:new, :create, :show, :destroy] do
    resources :bookings, only: :create
  end
  resources :bookings, only: [:update, :destroy] do
    resources :messages, only: [:index, :create]
    resources :reviews, only: [:new, :create]
  end
end
