Rails.application.routes.draw do

  root "sessions#new"
  resources :users, only: [:index, :new, :create, :show]
  resources :sessions, only: [:new, :create]
  get '/logout', to: 'sessions#destroy', as: :logout

  resources :guardian_profiles do
    resources :memories, only: [:new, :create, :edit, :update, :destroy]
    resources :notes, only: [:new, :destroy, :create, :edit, :update]
  end
end

