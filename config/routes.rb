Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :update, :edit] do
  end

  resources :events, only: [:new, :create, :show]

  post 'events/:event_id/:user_id/bookings', to: 'bookings#create', as: :bookings_create
  resources :bookings, only: [:update]
end
